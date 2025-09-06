// class MemberModel {
//   final int id;
//   final String? nameNp;
//   final String? nameEn;
//   final String? dobAd;
//   final String? dobBs;
//   final String? mobileNo;
//   final String? citizenshipNumber;
//   final String? idCardNo;
//   final String? imageUrl;

//   MemberModel({
//     required this.id,
//     this.nameNp,
//     this.nameEn,
//     this.dobAd,
//     this.dobBs,
//     this.mobileNo,
//     this.citizenshipNumber,
//     this.idCardNo,
//     this.imageUrl,
//   });

//   factory MemberModel.fromJson(Map<String, dynamic> json) {
//     return MemberModel(
//       id: json['id'],
//       nameNp: json['name_np'],
//       nameEn: json['name_en'],
//       dobAd: json['dob_ad'],
//       dobBs: json['dob_bs'],
//       mobileNo: json['mobile_no']?.toString(),
//       citizenshipNumber: json['citizenship_number'],
//       idCardNo: json['id_card_no'],
//       imageUrl: json['image_upload'],
//     );
//   }
// }



// lib/models/member_model.dart

class Member {
  final int? id;
  final String? code;
  final String? nameNp;
  final String? nameEn;
  final String? dobBs;
  final String? dobAd;
  final String? imageUrl;
  final String? citizenshipNumber;
  final String? votercardNumber;
  final String? citizenshipIssueDistrictCode;
  final String? citizenshipIssueDateBs;
  final String? citizenshipIssueDateAd;
  final String? email;
  final int? mobileNo;
  final String? secondaryMobileNo;
  final int? continentId;
  final int? countryId;
  final String? perProvinceCode;
  final String? perDistrictCode;
  final String? perLocalBodyCode;
  final int? perWardNo;
  final String? perStreetName;
  final String? tempProvinceCode;
  final String? tempDistrictCode;
  final String? tempLocalBodyCode;
  final int? tempWardNo;
  final String? tempStreetName;
  final String? fatherNameNp;
  final String? fatherNameEn;
  final String? motherNameNp;
  final String? motherNameEn;
  final String? husbandNameNp;
  final String? husbandNameEn;
  final String? wifeNameNp;
  final String? wifeNameEn;
  final int? familyNo;
  final int? qualificationTypeId;
  final int? genderId;
  final int? religionId;
  final String? maritalStratusId; // Assuming it can be null
  final int? castGroupId;
  final String? memberJoinedDateBs;
  final String? memberJoinedDateAd;
  final String? memberJoinedYear; // Assuming it can be null
  final String? memberNo; // Assuming it can be null
  final String? pastResponsibility; // Assuming it can be null
  final String? perParlamentElectionNo; // Assuming it can be null
  final String? perProvinceElectionNo; // Assuming it can be null
  final String? perProvinceElectionPlace; // Assuming it can be null
  final String? tempParlamentElectionNo; // Assuming it can be null
  final String? tempProvinceElectionNo;
  final String? tempProvinceElectionPlace;
  final int? memberTypeId;
  final String? addressDetails; // Assuming it can be null
  final String? passportNumber; // Assuming it can be null
  final String? passportIssuedDateBs; // Assuming it can be null
  final String? passportIssuedDateAd; // Assuming it can be null
  final String? password;
  final String? otpCode;
  final String? otpCodeCreatedBs;
  final String? otpCodeCreatedAd;
  final int? otpCount;
  final String? otpToken; // Assuming it can be null
  final bool? passwordStatus;
  final String? userName;
  final bool? status;
  final bool? emailSent;
  final String? emailSentDateNp; // Assuming it can be null
  final String? emailSentDateEn; // Assuming it can be null
  final bool? isVerified;
  final String? verifiedDateNp;
  final String? verifiedDateEn;
  final int? verifiedBy;
  final String? idCardNo;
  final String? idcardExpirationDateBs;
  final String? idcardExpirationDateAd;
  final bool? isWorkingCommitteeAddAccess;
  final String? workingCommitteeAddAccessDateNp; // Assuming it can be null
  final String? workingCommitteeAddAccessDateEn; // Assuming it can be null
  final String? workingCommitteeAddAccessBy; // Assuming it can be null
  final int? designationId;
  final bool? isCentralMember;
  final bool? isApproved;
  final int? approvedBy;
  final String? approvedDateBs;
  final String? approvedDateAd;
  final String? ageRangeId; // Assuming it can be null
  final String? userId; // Assuming it can be null
  final bool? blockStatus;
  final bool? isReject;
  final String? rejectReason; // Assuming it can be null
  final String? rejectBy; // Assuming it can be null
  final String? rejectDateBs; // Assuming it can be null
  final String? rejectDateAd; // Assuming it can be null
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? deletedAt; // Assuming it can be null
  final String? memberChargeType;
  final String? idcardIssuedDateBs;
  final String? idcardIssuedDateAd;
  final String? perDistrictName; // Assuming it can be null
  final String? perLocalBodyName; // Assuming it can be null
  final String? previousServiceName; // Assuming it can be null
  final bool? isExportData;
  final int? createdBy;
  final int? updatedBy;
  final String? deletedBy; // Assuming it can be null
  final String? membershipRenewRemarks; // Assuming it can be null

  Member({
    this.id,
    this.code,
    this.nameNp,
    this.nameEn,
    this.dobBs,
    this.dobAd,
    this.imageUrl,
    this.citizenshipNumber,
    this.votercardNumber,
    this.citizenshipIssueDistrictCode,
    this.citizenshipIssueDateBs,
    this.citizenshipIssueDateAd,
    this.email,
    this.mobileNo,
    this.secondaryMobileNo,
    this.continentId,
    this.countryId,
    this.perProvinceCode,
    this.perDistrictCode,
    this.perLocalBodyCode,
    this.perWardNo,
    this.perStreetName,
    this.tempProvinceCode,
    this.tempDistrictCode,
    this.tempLocalBodyCode,
    this.tempWardNo,
    this.tempStreetName,
    this.fatherNameNp,
    this.fatherNameEn,
    this.motherNameNp,
    this.motherNameEn,
    this.husbandNameNp,
    this.husbandNameEn,
    this.wifeNameNp,
    this.wifeNameEn,
    this.familyNo,
    this.qualificationTypeId,
    this.genderId,
    this.religionId,
    this.maritalStratusId,
    this.castGroupId,
    this.memberJoinedDateBs,
    this.memberJoinedDateAd,
    this.memberJoinedYear,
    this.memberNo,
    this.pastResponsibility,
    this.perParlamentElectionNo,
    this.perProvinceElectionNo,
    this.perProvinceElectionPlace,
    this.tempParlamentElectionNo,
    this.tempProvinceElectionNo,
    this.tempProvinceElectionPlace,
    this.memberTypeId,
    this.addressDetails,
    this.passportNumber,
    this.passportIssuedDateBs,
    this.passportIssuedDateAd,
    this.password,
    this.otpCode,
    this.otpCodeCreatedBs,
    this.otpCodeCreatedAd,
    this.otpCount,
    this.otpToken,
    this.passwordStatus,
    this.userName,
    this.status,
    this.emailSent,
    this.emailSentDateNp,
    this.emailSentDateEn,
    this.isVerified,
    this.verifiedDateNp,
    this.verifiedDateEn,
    this.verifiedBy,
    this.idCardNo,
    this.idcardExpirationDateBs,
    this.idcardExpirationDateAd,
    this.isWorkingCommitteeAddAccess,
    this.workingCommitteeAddAccessDateNp,
    this.workingCommitteeAddAccessDateEn,
    this.workingCommitteeAddAccessBy,
    this.designationId,
    this.isCentralMember,
    this.isApproved,
    this.approvedBy,
    this.approvedDateBs,
    this.approvedDateAd,
    this.ageRangeId,
    this.userId,
    this.blockStatus,
    this.isReject,
    this.rejectReason,
    this.rejectBy,
    this.rejectDateBs,
    this.rejectDateAd,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.memberChargeType,
    this.idcardIssuedDateBs,
    this.idcardIssuedDateAd,
    this.perDistrictName,
    this.perLocalBodyName,
    this.previousServiceName,
    this.isExportData,
    this.createdBy,
    this.updatedBy,
    this.deletedBy,
    this.membershipRenewRemarks,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      code: json['code'],
      nameNp: json['name_np'],
      nameEn: json['name_en'],
      dobBs: json['dob_bs'],
      dobAd: json['dob_ad'],
      imageUrl: json['image_upload'],
      citizenshipNumber: json['citizenship_number'],
      votercardNumber: json['Votercard_number'],
      citizenshipIssueDistrictCode: json['citizenship_issue_district_code'],
      citizenshipIssueDateBs: json['citizenship_issue_date_bs'],
      citizenshipIssueDateAd: json['citizenship_issue_date_ad'],
      email: json['email'],
      mobileNo: json['mobile_no'],
      secondaryMobileNo: json['secondary_mobile_no'],
      continentId: json['continent_id'],
      countryId: json['country_id'],
      perProvinceCode: json['per_province_code'],
      perDistrictCode: json['per_district_code'],
      perLocalBodyCode: json['per_local_body_code'],
      perWardNo: json['per_ward_no'],
      perStreetName: json['per_street_name'],
      tempProvinceCode: json['temp_province_code'],
      tempDistrictCode: json['temp_district_code'],
      tempLocalBodyCode: json['temp_local_body_code'],
      tempWardNo: json['temp_ward_no'],
      tempStreetName: json['temp_street_name'],
      fatherNameNp: json['father_name_np'],
      fatherNameEn: json['father_name_en'],
      motherNameNp: json['mother_name_np'],
      motherNameEn: json['mother_name_en'],
      husbandNameNp: json['husband_name_np'],
      husbandNameEn: json['husband_name_en'],
      wifeNameNp: json['wife_name_np'],
      wifeNameEn: json['wife_name_en'],
      familyNo: json['family_no'],
      qualificationTypeId: json['qualification_type_id'],
      genderId: json['gender_id'],
      religionId: json['religion_id'],
      maritalStratusId: json['marital_stratus_id'],
      castGroupId: json['cast_group_id'],
      memberJoinedDateBs: json['member_joined_date_bs'],
      memberJoinedDateAd: json['member_joined_date_ad'],
      memberJoinedYear: json['member_joined_year'],
      memberNo: json['member_no'],
      pastResponsibility: json['past_responsibility'],
      perParlamentElectionNo: json['per_parlament_election_no'],
      perProvinceElectionNo: json['per_province_election_no'],
      perProvinceElectionPlace: json['per_province_election_place'],
      tempParlamentElectionNo: json['temp_parlament_election_no'],
      tempProvinceElectionNo: json['temp_province_election_no'],
      tempProvinceElectionPlace: json['temp_province_election_place'],
      memberTypeId: json['member_type_id'],
      addressDetails: json['address_details'],
      passportNumber: json['passport_number'],
      passportIssuedDateBs: json['passport_issued_date_bs'],
      passportIssuedDateAd: json['passport_issued_date_ad'],
      password: json['password'],
      otpCode: json['otp_code'],
      otpCodeCreatedBs: json['otp_code_created_bs'],
      otpCodeCreatedAd: json['otp_code_created_ad'],
      otpCount: json['otp_count'],
      otpToken: json['otp_token'],
      passwordStatus: json['password_status'],
      userName: json['user_name'],
      status: json['status'],
      emailSent: json['email_sent'],
      emailSentDateNp: json['email_sent_date_np'],
      emailSentDateEn: json['email_sent_date_en'],
      isVerified: json['is_verified'],
      verifiedDateNp: json['verified_date_np'],
      verifiedDateEn: json['verified_date_en'],
      verifiedBy: json['verified_by'],
      idCardNo: json['id_card_no'],
      idcardExpirationDateBs: json['idcard_expiration_date_bs'],
      idcardExpirationDateAd: json['idcard_expiration_date_ad'],
      isWorkingCommitteeAddAccess: json['is_working_committee_add_access'],
      workingCommitteeAddAccessDateNp: json['working_committee_add_access_date_np'],
      workingCommitteeAddAccessDateEn: json['working_committee_add_access_date_en'],
      workingCommitteeAddAccessBy: json['working_committee_add_access_by'],
      designationId: json['designation_id'],
      isCentralMember: json['is_central_member'],
      isApproved: json['is_approved'],
      approvedBy: json['approved_by'],
      approvedDateBs: json['approved_date_bs'],
      approvedDateAd: json['approved_date_ad'],
      ageRangeId: json['age_range_id'],
      userId: json['user_id'],
      blockStatus: json['block_status'],
      isReject: json['is_reject'],
      rejectReason: json['reject_reason'],
      rejectBy: json['reject_by'],
      rejectDateBs: json['reject_date_bs'],
      rejectDateAd: json['reject_date_ad'],
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      deletedAt: json['deleted_at'],
      memberChargeType: json['member_charge_type'],
      idcardIssuedDateBs: json['idcard_issued_date_bs'],
      idcardIssuedDateAd: json['idcard_issued_date_ad'],
      perDistrictName: json['per_district_name'],
      perLocalBodyName: json['per_local_body_name'],
      previousServiceName: json['previous_service_name'],
      isExportData: json['is_export_data'],
      createdBy: json['created_by'],
      updatedBy: json['updated_by'],
      deletedBy: json['deleted_by'],
      membershipRenewRemarks: json['membership_renew_remarks'],
    );
  }
}