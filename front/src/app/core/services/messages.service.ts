import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Message } from '../interfaces/messages.interface';

@Injectable({
  providedIn: 'root'
})
export class MessagesService {

    private pathService = 'api/messages';

    constructor(private httpClient: HttpClient) { }

    public createMessage(message: Message): Observable<Message> {
        return this.httpClient.post<Message>(this.pathService, message);
    }


    public getMessageById(messageId: number): Observable<Message> {
        return this.httpClient.get<Message>(`${this.pathService}/${messageId}`);
    }

    public getMessagesByDiscussionId(discussionId: number): Observable<Message[]> {
        return this.httpClient.get<Message[]>(`${this.pathService}/discussion/${discussionId}`);
    }

    public getMessagesByUserId(userId: number): Observable<Message[]> {
        return this.httpClient.get<Message[]>(`${this.pathService}/user/${userId}`);
    }

}
