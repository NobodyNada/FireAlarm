//
//  Post.h
//  chatbot
//
//  Created on 5/18/16.
//  Copyright © 2016 NobodyNada. All rights reserved.
//

#ifndef Post_h
#define Post_h

typedef struct _ChatBot ChatBot;
typedef struct _SOUser SOUser;

typedef struct {
    char *title;
    char *body;
    unsigned long postID;
    unsigned char isAnswer;
    SOUser *owner;
}Post;

Post *createPost(const char *title, const char *body, unsigned long postID, unsigned char isAnswer, SOUser *user);
void deletePost(Post *p);
int getCloseVotesByID (ChatBot *bot, unsigned long postID);
int isPostClosed (ChatBot *bot, unsigned long postID);
char *getClosedReasonByID (ChatBot *bot, unsigned long postID);

#endif /* Post_h */
