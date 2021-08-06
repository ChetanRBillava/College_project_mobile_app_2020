import 'package:flutter/material.dart';

bool isClicked = false, checkValue = false;


String domainURL ='https://192.168.16.232/mitk_college_project_2020_web_files/api/', studName, studMail;
int studPhone, total = 0, dateDiff, roomRentDateDiff;

final regNameController = TextEditingController(), regMailController = TextEditingController(),
    regPhoneController = TextEditingController(), regAddressController = TextEditingController(),
    regGuardNameController = TextEditingController(), regGuardPhoneController = TextEditingController(), regGuardMailController = TextEditingController(),
    regSSLCController = TextEditingController(), regPUCController = TextEditingController(),
    regAdmissionFeesController = TextEditingController(),
    loginMailController = TextEditingController(), loginPwdController = TextEditingController(),
    leaveMail = TextEditingController(), reason = TextEditingController(),
    oldPwd = TextEditingController(), newPwd = TextEditingController()
;

var admissionType, studentType, branch, gen, semester,
    paymentFor, transDetails, transType, transAmount, transDate, transOTP,
    startDate, endDate, returningDate, leaveType
;


final List<String>stuType = ['Localite', 'Hostelite'],
    admisType = ['CET', 'MANAGEMENT'],
    branchList = ['CSE', 'ME', 'ISE', 'EEE', 'ECE', 'MBA'],
    leaveTypes = ['Sick Leave', 'Casual Leave','Other'],
    gender = ['Male', 'Female'],
    sem = ['1', '2', '3', '4', '5', '6', '7', '8']
;
final List  studentDetails = [],stationary = [], leaves = [], hostelDetails = [], roomMateDetails = [], roomList = [],
    admission = [], mess = [], rent = [], purchases = [], hostelPayment = [], cart = []
;