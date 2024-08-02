import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Discussion } from '../interfaces/discussions.interface';

@Injectable({
  providedIn: 'root'
})
export class DiscussionsService {

    private pathService = 'api/discussions';

    constructor(private httpClient: HttpClient) { }

    public createDiscussion(discussion: Discussion): Observable<Discussion> {
        return this.httpClient.post<Discussion>(this.pathService, discussion);
    }

    public getAllDiscussions(): Observable<Discussion[]> {
        return this.httpClient.get<Discussion[]>(this.pathService);
    }

    public getDiscussionsByUserId(userId: number): Observable<Discussion[]> {
        return this.httpClient.get<Discussion[]>(`${this.pathService}/user/${userId}`);
    }

    public getDiscussionById(discussionId: number): Observable<Discussion> {
        return this.httpClient.get<Discussion>(`${this.pathService}/${discussionId}`);
    }

    public updateDiscussionStatusById(discussionId: number, discussion: Discussion): Observable<Discussion> {
        return this.httpClient.put<Discussion>(`${this.pathService}/${discussionId}`, discussion);
    }

}
