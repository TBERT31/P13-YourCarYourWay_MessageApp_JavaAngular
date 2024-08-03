export interface Message {
    id: number;
    content: string;
    discussion_id: number;
    author: string;
    direct: boolean;
    createdAt?: Date;
    updatedAt?: Date;
}