package com.example.spring02.controller.message;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.spring02.model.message.dto.MessageDTO;
import com.example.spring02.service.message.MessageService;

@RestController
@RequestMapping("/messages/*")
public class MessageController {

	@Inject MessageService messageService;
	
	// ResponseEntity : Http Status Code(http 상태코드) + 데이터를 전달
	// @RequestBody : 클라이언트 -> 서버( json 데이터가 입력될 때 )
	// @ResponseBody : 서버 -> 클라이언트 (json )
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public ResponseEntity<String> addMessage(@RequestBody MessageDTO dto) {
		ResponseEntity<String> entity = null;
		try {
			messageService.addMessage(dto);
			// new ResponseEntity<자료형>(리턴값, http status code)
			entity = new ResponseEntity<>("success", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
