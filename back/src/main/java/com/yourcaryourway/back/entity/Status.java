package com.yourcaryourway.back.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import lombok.*;
import lombok.experimental.Accessors;

import java.util.Set;

@Entity
@Table(name = "STATUS")
@Data
@Accessors(chain = true)
@EqualsAndHashCode(of = {"name"})
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Status {
    @Id
    @Column(name = "name", length = 50)
    @Size(max = 50, message = "Status name must be less than 50 characters")
    @NotBlank(message = "Status name is mandatory")
    private String name;

    @OneToMany(mappedBy = "status", cascade = CascadeType.ALL, orphanRemoval = true)
    @ToString.Exclude
    private Set<Discussion> discussions;
}
