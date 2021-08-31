//
//  Localizable.swift
//  
//
//  Created by Sumit Jagdev on 25/05/20.
//  Copyright © 2020 GWL. All rights reserved.
//
// swiftlint:disable all

import UIKit

public enum Localizable {
    enum Global: String, LocalizableProtocol {
        case cancel, ok, yes, no, alert, warning
        case internetNotAvailable
        case somethingWentWrong
        case password
        case deviceToken
        case authorization
        case cameraWarning
        case firstName
        case lastName
        case userName
        case email
        case confirmPassword
        case state
        case city
        case country
        case signOutMessage
        case userNameAndEmail
        case emailMessage
        case blockedUsers
        case mobileNo
        case invitationSentSuccess
    }
    enum SideMenuOptions: String, LocalizableProtocol {
        //Player side menu options
        case homeFeed
        case matches
        case profile
        case profileInfo
        case accountDetails
        case managePayments
        case requests
        case blockedUsers
        case tutorial
        case settings
        case reportProblem
        case contactUs
        case logout
        case privacyPolicy
        case none
        case line
        //Fied Owner side menu options
        case accountInformation
        case facilityHoursRates
        case reservationRequests
        case calendar
        case revenueTransaction
        case signOut
        //Settings options
        case changePassword
        case language
        case termsofServices
    }
    // Player Profile
    enum PlayerProfileSetup: String, LocalizableProtocol {
        case speed
        case shooting
        case dribbling
        case passing
        case fitness
        case fullName
        case dateOfBirth
        case nationality
        case primary
        case secondary
        case personal
        case mySkills
        case info
        case weight
        case height
        case lRFoot
        case jerseyNumber
        case team
        case favouriteClub
        case favouriteBrand
        case primaryPositionTitle
        case searchSecondaryTitle
        case searchPrimaryPosition
        case searchSecondaryPosition
        case beginner
        case intermediate
        case advanced
    }
    // side Menu
    enum PlayerSideMenu: String, LocalizableProtocol {
        case matches
        case myAccount
        case contactUs
        case settings
        case signOut
    }
    // Navigation Title
    enum NavigationTitle: String, LocalizableProtocol {
        case signUpTitle
        case signUpSubTitle
        case otp
        case forgotPassword
        case profileSetup
        case facilityTitle
        case facilitySubTitle
        case facilityDetails
        case fieldDetails
        case fields
        case addNewFacility
        case addNewField
        case fieldsAvailable
        case invite
        case createGames
        case gameCentral
        case search
        case message
        case notification
        case profile
        case editProfile
        case changePassword
        case uploadId
        case reservatioReq
        case reservatioDetails
        case emailAddress
        case games
        case player
        case gameDetails
        case allPlayers
        case mapView
        case editField
        case addBankAccount
        case editBankAccount
        case editFacility
        case transactions
        case bookField
        case dateandTime
        case accountDetails
        case feedTitle
        case bookingDetails
        case termsAndCondition
        case invitePlayers
        case myGroups
    }
    // Facility
    enum Facility: String, LocalizableProtocol {
        case facilityName
        case address
        case address2
        case description
        case searchState
        case searchCity
        case selectCity
        case selectState
        case managerName
        case managerPhone
        case managerEmail
        case managerWebsite
    }
    // Field
    enum Field: String, LocalizableProtocol {
        case fieldName
        case depositeAmount
        case fieldType
        case rentalType
        case rate
        case startTime
        case endTime
        case fieldSize
        case fieldDescription
        case price
        case perHour
    }
    // Error Code
    enum ErrorCode: String, LocalizableProtocol {
        case otpVerifed
    }
    // Bank Details
    enum BankDetails: String, LocalizableProtocol {
        case bankName
        case accountHolderName
        case accountNumber
        case confirmAccountNumber
    }
    // GameCenter
    enum GameCenter: String, LocalizableProtocol {
        case myGames
        case invites
        case requests
    }
    //Change Password
    enum ChangePassword: String, LocalizableProtocol {
        case currentPassword
    }
    //Invite
    enum Invite: String, LocalizableProtocol {
        case searchUser
        case searchBank
        case searchByUsername
    }
    //My Group
    enum MyGroup: String, LocalizableProtocol {
        case group
    }
    //Transactions Filter
    enum TransactionsFilter: String, LocalizableProtocol {
        case field
        case facility
        case selectYear
        case startDate
        case endDate
        case selectFacility
        case selectField
        case searchFacility
        case searchField
    }
    //Reservation
    enum Reservation: String, LocalizableProtocol {
        case gameName
        case filedName
        case organizer
        case gameDate
        case gameType
        case timeSlot
        case noOfPlayers
        case location
    }
    //Search
    enum PlayerSearch: String, LocalizableProtocol {
        case games
        case player
        case field
        case gameDate
        case gameType
        case timeSlot
        case noOfPlayers
        case location
    }
    //Weekdays
    enum Weekdays: String, LocalizableProtocol {
        case sunday
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
    }
    //All Players
    enum AllPlayers: String, LocalizableProtocol {
        case searchPlayers
    }
    enum Community: String, LocalizableProtocol {
        case readPolicy
        case title
        case subtitle
    }
    //Transactions
    enum Transactions: String, LocalizableProtocol {
        case transactionId
        case pending
        case received
        case cancelled
    }
    //Tutorial
    enum Tutorial: String, LocalizableProtocol {
        case headingBooking
        case headingGames
        case bookField
        case rateField
        case cancellBooking
        case createGame
        case uploadScoreCard
        case cancelGame
    }
    enum VaildationMessages: String, LocalizableProtocol {
        case userNameLength
        case emailorUserNameEmpty
        case vaildEmailAddress
        case emailEmpty
        case userNameEmpty
        case passwordEmpty
        case confirmPasswordEmpty
        case passwordMatchMessage
        case firstNameEmpty
        case lastNameEmpty
        case dobEmpty
        case cityEmpty
        case countryEmpty
        case nationalityEmpty
        case primarySkillsEmpty
        case secondarySkillsEmpty
        case passwordLengthMessage
        case userNameMessage
        case otpIsEmpty
        case fullNameEmpty
        case facilityNameMessage
        case facilityDescriptionMessage
        case fieldDescriptionMessage
        case fieldNameMessage
        case filedTypeMessage
        case ratePerHourMessage
        case depositeAmountMessage
        case startTimeMessage
        case endDateMessage
        case endTimeMessage
        case fieldSizeMessage
        case rentalTypeMessage
        case errorMessageForOtp
        case facilityAddressMessage
        case facilityAddress2Message
        case facilityStateMessage
        case facilityCityMessage
        case managerNameMessage
        case managerPhoneMessage
        case managerEmailMessage
        case vaildPhoneNumber
        case bankNameEmpty
        case bankAccountHolderEmpty
        case accountNumberEmpty
        case confirmAccountEmpty
        case equalConfirmAccount
        case writeProblemDescription
        case writeYourInquiry
        case selectDurationMessage
        case cardNumberMessage
        case cardHolderNameMessage
        case cardExpireMessage
        case cardCvvMessage
        case amountMessage
        case zipCodeMessage
        //Edit profile messages
        case ageEmpty
        case weightEmpty
        case heightEmpty
        case lrFootEmpty
        case teamEmpty
        case primaryPosEmpty
        case secondaryPosEmpty
        case jerseyNoEmpty
        case experienceEmpty
        case favClubEmpty
        case favBrandEmpty
        case mobileNoEmpty
        case mobileNoValid
        case none
        //Group module messages
        case groupNameEmpty
        case groupDescriptionEmpty
    }
    enum ReportAProblem: String, LocalizableProtocol {
        case emailAddress
        case writeProblem
    }
    enum ContactUs: String, LocalizableProtocol {
        case yourInquiry
    }
    //Filter
    enum Filter: String, LocalizableProtocol {
        case priceRange
        case distance
        case size
        case fieldType
        case sortBy
        case amenities
        case mostPopular
        case mostRelated
        case nearest
        case priceLowToHigh
        case priceHighToLow
        case selectAll
        case deselectAll
        case filterCount
        case defaultFilter
        case selectPrimary
        case searchPrimary
        case selectSecondary
        case searchSecondary
    }
    //AvailableFields
    enum AvailableFields: String, LocalizableProtocol {
        case amTime
        case pmTime
        case to
        case price
        case availableStatus
    }
    //Create Game
    enum CreateGame: String, LocalizableProtocol {
        case noOfPlayer
        case ageGroup
        case selectFilter
        case gameName
        case date
        case gameDescription
        case fieldName
        case fieldType
        case rentalType
        case ratePerHour
        case fieldSize
        case fieldDescription
        case description
        case searchUser
        case invites
        case requests
        case cityListTitle
        case SelectDateDuration
    }
    //Calendar
    enum Calendar: String, LocalizableProtocol {
        case selectDuration
    }
    //Book Field
    enum BookField: String, LocalizableProtocol {
        case date
        case time
        case deposit
        case totalPrice
        case cardNumber
        case mmyy
        case cvv
        case zipCode
        case amount
        case nameOnTheCard
        case creditCard
        case bankPayment
    }
    enum EditProfile: String, LocalizableProtocol {
        case age
        case dob
        case weight
        case height
        case lrFoot
        case team
        case primaryPosition
        case secondaryPosition
        case jerseyNo
        case experience
        case nationality
        case favClub
        case favBrand
    }
    enum ButtonTitles: String, LocalizableProtocol {
        case add
        case update
        case createGame
    }
    enum FeedTopOptions: String, LocalizableProtocol {
        case games
        case players
        case fields
        case groups
        case nearYou
    }
    enum PrivacyPolicyTitles: String, LocalizableProtocol {
        case termsCondition
        case privacypolicy
        case dosAndDonrtsPolicy
        case signInPrivacyMsg
        case loginPrivacyMsg
    }
    enum FeedType: String, LocalizableProtocol {
        case games
        case players
        case fields
        case groups
    }
    enum CreateGroups: String, LocalizableProtocol {
        case description
        case groupName
    }
}
