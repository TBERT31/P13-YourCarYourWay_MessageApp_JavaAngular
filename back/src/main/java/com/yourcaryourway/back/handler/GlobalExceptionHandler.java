package com.yourcaryourway.back.handler;

import com.yourcaryourway.back.exception.ForbiddenException;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;
import org.hibernate.TransientPropertyValueException;
import org.springframework.dao.DataIntegrityViolationException;
import com.yourcaryourway.back.exception.NotFoundException;
import com.yourcaryourway.back.exception.BadRequestException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.orm.ObjectOptimisticLockingFailureException;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingRequestHeaderException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.swing.text.BadLocationException;
import java.lang.IllegalArgumentException;
import java.util.List;
import java.util.stream.Collectors;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler({
            ExpiredJwtException.class,
            UnsupportedJwtException.class,
            MalformedJwtException.class,
            SignatureException.class
    })
    // Capture les exceptions JWT à un niveau global
    public ResponseEntity<ExceptionRepresentation> handleJwtException() {
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message("Invalid or expired JWT token")
                .build();

        // Retourne une réponse uniforme en cas d'erreur JWT avec un message d'erreur spécifique.
        return ResponseEntity
                .status(HttpStatus.UNAUTHORIZED)
                .body(representation);
    }

    @ExceptionHandler({
            NotFoundException.class
    })
    public ResponseEntity<ExceptionRepresentation> handleNotFoundException(NotFoundException notFoundException) {
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(notFoundException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.NOT_FOUND)
                .body(representation);
    }

    @ExceptionHandler({
            NullPointerException.class
    })
    public ResponseEntity<ExceptionRepresentation> handleNullPointerException(NullPointerException nullPointerException) {
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(nullPointerException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.NOT_FOUND)
                .body(representation);
    }

    @ExceptionHandler({
            BadLocationException.class
    })
    public ResponseEntity<ExceptionRepresentation> handleBadLocationException(BadLocationException badLocationException) {
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(badLocationException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.NOT_FOUND)
                .body(representation);
    }

    @ExceptionHandler({
            BadRequestException.class
    })
    public ResponseEntity<ExceptionRepresentation> handleBadRequestException(BadRequestException badRequestException) {
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(badRequestException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .body(representation);
    }

    @ExceptionHandler({
            NumberFormatException.class
    })
    public ResponseEntity<ExceptionRepresentation> handleNumberFormatException(NumberFormatException numberFormatException) {
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(numberFormatException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .body(representation);
    }


    @ExceptionHandler({
            MissingRequestHeaderException.class
    })
    public ResponseEntity<ExceptionRepresentation> handleMissingRequestHeaderException(MissingRequestHeaderException missingRequestHeaderException) {
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(missingRequestHeaderException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .body(representation);
    }

    @ExceptionHandler({
            IllegalArgumentException.class
    })
    public ResponseEntity<ExceptionRepresentation> handleIllegalArgumentException(IllegalArgumentException illegalArgumentException) {
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(illegalArgumentException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .body(representation);
    }

    @ExceptionHandler({
            IllegalStateException.class
    })
    public ResponseEntity<ExceptionRepresentation> handleIllegalStateException(IllegalStateException illegalStateException) {
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(illegalStateException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .body(representation);
    }


    @ExceptionHandler(BadCredentialsException.class)
    public ResponseEntity<ExceptionRepresentation> handleBadCredentialsException(){
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message("Your email and / or password is incorrect")
                .build();

        return ResponseEntity
                .status(HttpStatus.UNAUTHORIZED)
                .body(representation);
    }

    @ExceptionHandler(DataIntegrityViolationException.class)
    public ResponseEntity<ExceptionRepresentation> handleDataIntegrityViolationException(DataIntegrityViolationException dataIntegrityViolationException){
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(dataIntegrityViolationException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.CONFLICT)
                .body(representation);
    }

    @ExceptionHandler(ObjectOptimisticLockingFailureException.class)
    public ResponseEntity<ExceptionRepresentation> handleDataIntegrityViolationException(ObjectOptimisticLockingFailureException objectOptimisticLockingFailureException){
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(objectOptimisticLockingFailureException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.CONFLICT)
                .body(representation);
    }

    @ExceptionHandler(DisabledException.class)
    public ResponseEntity<ExceptionRepresentation> handleDisabledException(DisabledException disabledException){
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(disabledException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.FORBIDDEN)
                .body(representation);
    }

    @ExceptionHandler(ForbiddenException.class)
    public ResponseEntity<ExceptionRepresentation> handleForbiddenException(ForbiddenException forbiddenException){
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(forbiddenException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.FORBIDDEN)
                .body(representation);
    }

    @ExceptionHandler(TransientPropertyValueException.class)
    public ResponseEntity<ExceptionRepresentation> handleTransientPropertyValueException(TransientPropertyValueException transientPropertyValueException){
        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(transientPropertyValueException.getMessage())
                .build();

        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .body(representation);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ExceptionRepresentation> handleMethodArgumentNotValidException(MethodArgumentNotValidException methodArgumentNotValidException){
        List<String> errors = methodArgumentNotValidException.getBindingResult()
                .getAllErrors()
                .stream()
                .map(error -> {
                    if (error instanceof FieldError) {
                        return ((FieldError) error).getDefaultMessage();
                    } else {
                        return error.getDefaultMessage();
                    }
                })
                .collect(Collectors.toList());

        ExceptionRepresentation representation = ExceptionRepresentation.builder()
                .message(String.join(", ", errors))
                .build();

        return ResponseEntity
                .status(HttpStatus.BAD_REQUEST)
                .body(representation);
    }


}