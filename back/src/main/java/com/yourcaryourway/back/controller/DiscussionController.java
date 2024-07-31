package com.yourcaryourway.back.controller;

import com.yourcaryourway.back.dto.DiscussionDto;
import com.yourcaryourway.back.entity.Discussion;
import com.yourcaryourway.back.exception.NotFoundException;
import com.yourcaryourway.back.mapper.DiscussionMapper;
import com.yourcaryourway.back.service.DiscussionService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/discussions")
@RequiredArgsConstructor
@CrossOrigin(origins = "http://localhost:4200", maxAge = 3600)
public class DiscussionController {

    private final DiscussionService discussionService;
    private final DiscussionMapper discussionMapper;

    @PostMapping("")
    public ResponseEntity<DiscussionDto> createDiscussion(
        @Valid @RequestBody DiscussionDto discussionDto
    ){
        Discussion discussion = discussionService.createDiscussion(discussionMapper.toEntity(discussionDto));
        return ResponseEntity.ok(discussionMapper.toDto(discussion));
    }

    @GetMapping("")
    public ResponseEntity<List<DiscussionDto>> getAllDiscussion(){
        List<Discussion> discussions = discussionService.getAllDiscussions();
        return ResponseEntity.ok(discussionMapper.toDtoList(discussions));
    }

//    @GetMapping("/user/{userId}")
//    public ResponseEntity<List<DiscussionDto>> getDiscussionsByUserId(
//            @PathVariable Integer userId
//    ){
//        List<Discussion> discussions = discussionService.getDiscussionsByUserId(userId);
//        return ResponseEntity.ok(discussionMapper.toDtoList(discussions));
//    }

    @GetMapping("/{discussionId}")
    public ResponseEntity<DiscussionDto> getDiscussionById(
            @PathVariable Integer discussionId
    ){
        try{
            Discussion discussion = discussionService.getDiscussionById(discussionId);
            if(discussion != null){
                DiscussionDto discussionDto = discussionMapper.toDto(discussion);
                return ResponseEntity.ok(discussionDto);
            }else{
                return ResponseEntity.notFound().build();
            }
        }catch (NumberFormatException e){
            return ResponseEntity.badRequest().build();
        }
    }

    @PutMapping("/{discussionId}")
    public ResponseEntity<DiscussionDto> updateDiscussionStatusById(
            @Valid @RequestBody DiscussionDto discussionDto
    ){
        try {
            Discussion updatedDiscussion = discussionService.updateDiscussionStatusById(
                    discussionDto.getStatus(), discussionDto.getId()
            );

            DiscussionDto updatedDiscussionDto = discussionMapper.toDto(updatedDiscussion);

            return ResponseEntity.ok(updatedDiscussionDto);

        } catch (NotFoundException e) {
            return ResponseEntity.notFound().build();

        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }

}
