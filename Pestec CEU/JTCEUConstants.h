//
//  JTCEUConstants.h
//  PestecCEU
//
//  Created by Admin on 8/28/14.
//  Copyright (c) 2014 Gabriel. All rights reserved.
//


#pragma mark - Misc Enums

typedef enum JTCourseStatusIndex : NSUInteger {
    JTCourseStatusNotStarted = 0,
	JTCourseStatusStarted = 1,
    JTCourseStatusRead = 2,
    JTCourseStatusCompleted = 3
} JTCourseStatusIndex;


typedef enum JTWorkerTypeIndex : NSUInteger {
    JTWorkerTypeApplicator = 0,
    JTWorkerTypeFieldRep,
    JTWorkerTypeOperator
} JTWorkerTypeIndex;


#pragma mark - Quiz Question Types
extern NSString *const kJTQuizQuestionTypeMC; // Multiple Choice
extern NSString *const kJTQuizQuestionTypeTF; // True/False




#pragma mark - tableView constaints

typedef enum {
    JTApplicatorVCSectionRules = 0,
    JTApplicatorVCSectionPesticide,
    JTApplicatorVCSectionIPM
} JTApplicatorVCSectionType;

typedef enum {
    JTFieldRepVCSectionRules = 0,
    JTFieldRepVCSectionTechnical,
    JTFieldRepVCSectionIPM,
    JTFieldRepVCSectionGeneral
} JTFieldRepVCSectionType;

typedef enum {
    JTOperatorVCSectionRules = 0,
    JTOperatorVCSectionTechnical,
    JTOperatorVCSectionIPM,
    JTOperatorVCSectionGeneral
} JTOperatorVCSectionType;

// Sections
#define numSectionsApplicatorVC 3
#define numSectionsOperatorVC 4
#define numSectionsOperatorVC 4


// Rows -- ApplicatorVC
#define numRowsApplicatorRules 4
#define numRowsApplicatorPesticide 6
#define numRowsApplicatorIPM 2

// Rows -- FieldRepVC
#define numRowsFieldRepRules 8
#define numRowsFieldRepTechinical 4
#define numRowsFieldRepIPM 2
#define numRowsFieldRepGeneral 2

// Rows -- OperatorVC
#define numRowsOperatorRules 8
#define numRowsOperatorTechinical 4
#define numRowsOperatorIPM 2
#define numRowsOperatorGeneral 2


// Misc
#define heightForSectionHeader 44.0f

#pragma mark - other

#define courseLength 10


#pragma mark - Strings

#define workerReqsListApplicatorRules @"4 HRS Rules & Regs";

#define workerReqsListApplicator @"4 HRS Rules & Regs\n 6 HRS Pesticde Use & App\n "


