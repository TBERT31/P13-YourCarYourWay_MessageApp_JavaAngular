package com.yourcaryourway.back.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "USERS")
@Data
@Accessors(chain = true)
@EntityListeners(AuditingEntityListener.class)
@EqualsAndHashCode(of = {"id"})
@Builder
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
@ToString
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @NotBlank(message = "Email is mandatory")
    @Size(max = 50, message = "Email must be less than 50 characters")
    @Column(name = "email", unique = true)
    @Email(message = "Email is not compliant")
    @NonNull
    private String email;

    @NotBlank(message = "Password is mandatory")
    @Size(min = 8, max = 255, message = "Password must be between 8 and 255 characters")
    @NonNull
    @Pattern(
            regexp = "(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=,?;./:!§£*()-_¨µ<>{}]).{8,}",
            message = "Password must contain at least one digit, one lowercase letter, one uppercase letter, one special character and at least 8 characters"
    )
    @Column(name = "password")
    private String password;

    @NotBlank(message = "Firstname is mandatory")
    @Size(max = 50, message = "Firstname must be less than 50 characters")
    @Column(name = "firstname")
    @NonNull
    private String firstname;

    @NotBlank(message = "Lastname is mandatory")
    @Size(max = 50, message = "Lastname must be less than 50 characters")
    @Column(name = "Lastname")
    @NonNull
    private String lastname;

    @NotNull(message = "Birth date is mandatory")
    @Column(name = "birth_date")
    @NonNull
    private LocalDate birthDate;

    @NotBlank(message = "Address is mandatory")
    @Size(max = 255, message = "Address must be less than 255 characters")
    @Column(name = "address")
    @NonNull
    private String address;

    @Column(name = "admin", nullable = false, columnDefinition = "TINYINT")
    private boolean admin = false;

    @CreatedDate
    @CreationTimestamp
    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @LastModifiedDate
    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @OneToMany(mappedBy = "author", cascade = CascadeType.ALL, orphanRemoval = true)
    @ToString.Exclude
    private Set<Message> messages;

    @ManyToMany(mappedBy = "users_participants", fetch = FetchType.LAZY)
    private Set<Discussion> discussions_participants;

    /************* PARTIE USERDETAILS ***************/

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of();
    }

    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
