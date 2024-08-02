export interface User {
    id: number;
    email: string;
    password: string;
    firstname: string;
    lastname: string;
    birthDate: string;
    address: string;
    admin?: boolean;
    createdAt?: Date;
    updatedAt?: Date;
    messageIds?: number[];
    discussionIds?: number[];
}