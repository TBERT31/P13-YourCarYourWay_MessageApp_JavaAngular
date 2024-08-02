export interface Discussion {
    id: number;
    title: string;
    status: string;
    author?: string;
    createdAt?: Date;
    updatedAt?: Date;
    participantIds?: number[];
    messageIds?: number[];
}