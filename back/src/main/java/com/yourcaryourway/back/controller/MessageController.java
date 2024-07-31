package com.yourcaryourway.back.controller;

import com.yourcaryourway.back.dto.MessageDto;
import com.yourcaryourway.back.entity.Message;
import com.yourcaryourway.back.exception.NotFoundException;
import com.yourcaryourway.back.mapper.MessageMapper;
import com.yourcaryourway.back.service.MessageService;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/messages")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
@Tag(name = "Messages")
public class MessageController {

    private final MessageService messageService;
    private final MessageMapper messageMapper;

    @PostMapping("")
    public ResponseEntity<MessageDto> createMessage(
            @Valid @RequestBody MessageDto messageDto
    ){
        Message message = messageService.createMessage(
                messageMapper.toEntity(messageDto)
        );

        return ResponseEntity.ok(messageMapper.toDto(message));
    }

    @GetMapping("/{messageId}")
    public ResponseEntity<MessageDto> getMessageById(
            @PathVariable Integer messageId
    ){
        try{
            Message message = messageService.getMessageById(messageId);
            if(message != null){
                MessageDto messageDto = messageMapper.toDto(message);
                return ResponseEntity.ok(messageDto);
            }else{
                return ResponseEntity.notFound().build();
            }
        }catch (NumberFormatException e){
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/discussion/{discussionId}")
    public ResponseEntity<List<MessageDto>> getMessagesByDiscussionId(
            @PathVariable Integer discussionId
    ){
        try{
            List<Message> messages = messageService.getMessagesByDiscussionId(discussionId);
            return ResponseEntity.ok(messageMapper.toDtoList(messages));
        }catch (NotFoundException e) {
            return ResponseEntity.notFound().build();
        }catch (NumberFormatException e){
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping("/user/{userId}")
    public ResponseEntity<List<MessageDto>> getMessagesByUserId(
            @PathVariable Integer userId
    ){
        try{
            List<Message> messages = messageService.getMessagesByUserId(userId);
            return ResponseEntity.ok(messageMapper.toDtoList(messages));
        }catch (NotFoundException e) {
            return ResponseEntity.notFound().build();
        }catch (NumberFormatException e){
            return ResponseEntity.badRequest().build();
        }
    }


}
