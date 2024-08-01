export interface Message {
    id: number;
    content: string;
    discussion_id: number;
    author_id: number;
    direct: boolean;
    createdAt?: Date;
    updatedAt?: Date;
}