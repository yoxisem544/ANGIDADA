//
//  StatusKeys.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/22.
//  Copyright (c) 2015年 David. All rights reserved.
//

struct StatusKey {
    // use to check if user finished the first Questionnaire, default is false
    static let userFinishedFirstQuestionnaire = "userFinishedFirstQuestionnaire"
    // count of user Questionnaire, default is 0
    static let userQuestionnaireCount = "userQuestionnaireCount"
    // check if user doesn't finished one of Questionnaire.
    static let userMissedOneOfTheQuestionnaire = "userMissedOneOfTheQuestionnaire"
    
}
