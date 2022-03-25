// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum RCSCAsset {
  public enum Assets {
    public static let rcBeautyEffect = ImageAsset(name: "rc_beauty_effect")
    public static let rcBeautyMakeup = ImageAsset(name: "rc_beauty_makeup")
    public static let rcBeautyRetouch = ImageAsset(name: "rc_beauty_retouch")
    public static let rcBeautySticker = ImageAsset(name: "rc_beauty_sticker")
    public static let rcBeautySwitchCamera = ImageAsset(name: "rc_beauty_switch_camera")
    public static let customServiceContact = ImageAsset(name: "custom_service_contact")
    public static let customerServiceAvatar = ImageAsset(name: "customer_service_avatar")
    public static let dialCallingIcon = ImageAsset(name: "dial_calling_icon")
    public static let dialCustomerBg = ImageAsset(name: "dial_customer_bg")
    public static let dialDeleteIcon = ImageAsset(name: "dial_delete_icon")
    public static let dialHideIcon = ImageAsset(name: "dial_hide_icon")
    public static let dialKeyboardIcon = ImageAsset(name: "dial_keyboard_icon")
    public static let rcCallEmptyIcon = ImageAsset(name: "rc_call_empty_icon")
    public static let radioRoomLeaveCup = ImageAsset(name: "radio_room_leave_cup")
    public static let leaveRoomUpIcon = ImageAsset(name: "leave_room_up_icon")
    public static let addMusicIcon = ImageAsset(name: "add_music_icon")
    public static let addedMusicIcon = ImageAsset(name: "added_music_icon")
    public static let deleteMusicIcon = ImageAsset(name: "delete_music_icon")
    public static let musicHeaderAddSelectedIcon = ImageAsset(name: "music_header_add_selected_icon")
    public static let musicHeaderAddUnselectedIcon = ImageAsset(name: "music_header_add_unselected_icon")
    public static let musicHeaderControlSelectedIcon = ImageAsset(name: "music_header_control_selected_icon")
    public static let musicHeaderControlUnselectedIcon = ImageAsset(name: "music_header_control_unselected_icon")
    public static let musicHeaderRoomlistSelected = ImageAsset(name: "music_header_roomlist_selected")
    public static let musicHeaderRoomlistUnselected = ImageAsset(name: "music_header_roomlist_unselected")
    public static let musicLocalFileIcon = ImageAsset(name: "music_local_file_icon")
    public static let musicPauseControlIcon = ImageAsset(name: "music_pause_control_icon")
    public static let musicPlayControlIcon = ImageAsset(name: "music_play_control_icon")
    public static let musicStickIcon = ImageAsset(name: "music_stick_icon")
    public static let playingMusicIcon = ImageAsset(name: "playing_music_icon")
    public static let appendForbiddenIcon = ImageAsset(name: "append_forbidden_icon")
    public static let backIndicatorImage = ImageAsset(name: "back_indicator_image")
    public static let backgroundImageSelected = ImageAsset(name: "background_image_selected")
    public static let backgroundImageUnselected = ImageAsset(name: "background_image_unselected")
    public static let backgroundSelectedIcon = ImageAsset(name: "background_selected_icon")
    public static let chatUnreadMore = ImageAsset(name: "chat_unread_more")
    public static let chatroomMessageCreator = ImageAsset(name: "chatroom_message_creator")
    public static let chatroomMessageManager = ImageAsset(name: "chatroom_message_manager")
    public static let circleBg = ImageAsset(name: "circle_bg")
    public static let closeVoiceroom = ImageAsset(name: "close_voiceroom")
    public static let connectMicStateConnecting = ImageAsset(name: "connect_mic_state_connecting")
    public static let connectMicStateNone = ImageAsset(name: "connect_mic_state_none")
    public static let connectMicStateWaiting = ImageAsset(name: "connect_mic_state_waiting")
    public static let createRoomIcon = ImageAsset(name: "create_room_icon")
    public static let createVoiceRoomIcon = ImageAsset(name: "create_voice_room_icon")
    public static let createVoiceRoomPen = ImageAsset(name: "create_voice_room_pen")
    public static let createVoiceRoomThumb = ImageAsset(name: "create_voice_room_thumb")
    public static let deleteForbiddenIcon = ImageAsset(name: "delete_forbidden_icon")
    public static let disableRemoteAudioIcon = ImageAsset(name: "disable_remote_audio_icon")
    public static let downWhiteArrow = ImageAsset(name: "down_white_arrow")
    public static let emptySeatUserAvatar = ImageAsset(name: "empty_seat_user_avatar")
    public static let emptyStar = ImageAsset(name: "empty_star")
    public static let exclamationPointIcon = ImageAsset(name: "exclamation_point_icon")
    public static let floatingRoomIcon = ImageAsset(name: "floating_room_icon")
    public static let forbiddenTextIcon = ImageAsset(name: "forbidden_text_icon")
    public static let fullStar = ImageAsset(name: "full_star")
    public static let giftHeartIcon = ImageAsset(name: "gift_heart_icon")
    public static let gradientBorder = ImageAsset(name: "gradient_border")
    public static let hideAudioEffectIcon = ImageAsset(name: "hide_audio_effect_icon")
    public static let inviteUsertoSeatIcon = ImageAsset(name: "invite_userto_seat_icon")
    public static let kickOutRoomIcon = ImageAsset(name: "kick_out_room_icon")
    public static let leaveVoiceroom = ImageAsset(name: "leave_voiceroom")
    public static let leftRankBg = ImageAsset(name: "left_rank_bg")
    public static let lockSeatIcon = ImageAsset(name: "lock_seat_icon")
    public static let messageBackground = ImageAsset(name: "message_background")
    public static let messageEmoji = ImageAsset(name: "message_emoji")
    public static let messageKeyboard = ImageAsset(name: "message_keyboard")
    public static let moreIcon = ImageAsset(name: "more_icon")
    public static let musicThumbIcon = ImageAsset(name: "music_thumb_icon")
    public static let muteMicrophoneIcon = ImageAsset(name: "mute_microphone_icon")
    public static let networkSpeedBad = ImageAsset(name: "network_speed_bad")
    public static let networkSpeedFine = ImageAsset(name: "network_speed_fine")
    public static let networkSpeedSoso = ImageAsset(name: "network_speed_soso")
    public static let openRemoteAudioIcon = ImageAsset(name: "open_remote_audio_icon")
    public static let pickUserDownSeatIcon = ImageAsset(name: "pick_user_down_seat_icon")
    public static let pickUserUpSeatIcon = ImageAsset(name: "pick_user_up_seat_icon")
    public static let pkCrownIcon = ImageAsset(name: "pk_crown_icon")
    public static let pkFailedIcon = ImageAsset(name: "pk_failed_icon")
    public static let pkFlashIcon = ImageAsset(name: "pk_flash_icon")
    public static let pkOngoingIcon = ImageAsset(name: "pk_ongoing_icon")
    public static let pkSeatDefaultSofa = ImageAsset(name: "pk_seat_default_sofa")
    public static let pkTieIcon = ImageAsset(name: "pk_tie_icon")
    public static let pkVsIcon = ImageAsset(name: "pk_vs_icon")
    public static let pkWinningIcon = ImageAsset(name: "pk_winning_icon")
    public static let plusUserToSeatIcon = ImageAsset(name: "plus_user_to_seat_icon")
    public static let plusWhiteBgIcon = ImageAsset(name: "plus_white_bg_icon")
    public static let privateRoomIcon = ImageAsset(name: "private_room_icon")
    public static let rightRankBg = ImageAsset(name: "right_rank_bg")
    public static let roomBackgroundImage1 = ImageAsset(name: "room_background_image1")
    public static let roomBackgroundImage2 = ImageAsset(name: "room_background_image2")
    public static let roomBackgroundImage3 = ImageAsset(name: "room_background_image3")
    public static let roomBackgroundImage4 = ImageAsset(name: "room_background_image4")
    public static let roomBackgroundImage5 = ImageAsset(name: "room_background_image5")
    public static let roomBackgroundImage6 = ImageAsset(name: "room_background_image6")
    public static let roomNoticeIcon = ImageAsset(name: "room_notice_icon")
    public static let roomOwner = ImageAsset(name: "room_owner")
    public static let roomScaleIcon = ImageAsset(name: "room_scale_icon")
    public static let roomUserNumberIcon = ImageAsset(name: "room_user_number_icon")
    public static let roomVoiceroomIcon = ImageAsset(name: "room_voiceroom_icon")
    public static let roomlistEmptyIcon = ImageAsset(name: "roomlist_empty_icon")
    public static let roomtypeSelectIcon = ImageAsset(name: "roomtype_select_icon")
    public static let roomtypeUnselectIcon = ImageAsset(name: "roomtype_unselect_icon")
    public static let showAudioEffectIcon = ImageAsset(name: "show_audio_effect_icon")
    public static let thumbEdit = ImageAsset(name: "thumb_edit")
    public static let triggerInputIcon = ImageAsset(name: "trigger_input_icon")
    public static let videoroomSettingVideoprops = ImageAsset(name: "videoroom_setting_videoprops")
    public static let voiceRoomGiftIcon = ImageAsset(name: "voice_room_gift_icon")
    public static let voiceRoomMessageIcon = ImageAsset(name: "voice_room_message_icon")
    public static let voiceRoomMicOrderIcon = ImageAsset(name: "voice_room_mic_order_icon")
    public static let voiceRoomSettingIcon = ImageAsset(name: "voice_room_setting_icon")
    public static let voiceRoomUsersEmptyIcon = ImageAsset(name: "voice_room_users_empty_icon")
    public static let voiceroomPkButton = ImageAsset(name: "voiceroom_pk_button")
    public static let voiceroomSettingAddseat = ImageAsset(name: "voiceroom_setting_addseat")
    public static let voiceroomSettingApplymode = ImageAsset(name: "voiceroom_setting_applymode")
    public static let voiceroomSettingBackground = ImageAsset(name: "voiceroom_setting_background")
    public static let voiceroomSettingFold = ImageAsset(name: "voiceroom_setting_fold")
    public static let voiceroomSettingFreemode = ImageAsset(name: "voiceroom_setting_freemode")
    public static let voiceroomSettingLockallseat = ImageAsset(name: "voiceroom_setting_lockallseat")
    public static let voiceroomSettingLockroom = ImageAsset(name: "voiceroom_setting_lockroom")
    public static let voiceroomSettingMinusseat = ImageAsset(name: "voiceroom_setting_minusseat")
    public static let voiceroomSettingMusic = ImageAsset(name: "voiceroom_setting_music")
    public static let voiceroomSettingMute = ImageAsset(name: "voiceroom_setting_mute")
    public static let voiceroomSettingMuteall = ImageAsset(name: "voiceroom_setting_muteall")
    public static let voiceroomSettingNotice = ImageAsset(name: "voiceroom_setting_notice")
    public static let voiceroomSettingSuspend = ImageAsset(name: "voiceroom_setting_suspend")
    public static let voiceroomSettingTitle = ImageAsset(name: "voiceroom_setting_title")
    public static let voiceroomSettingUnlockallseat = ImageAsset(name: "voiceroom_setting_unlockallseat")
    public static let voiceroomSettingUnlockroom = ImageAsset(name: "voiceroom_setting_unlockroom")
    public static let voiceroomSettingUnmute = ImageAsset(name: "voiceroom_setting_unmute")
    public static let voiceroomSettingUnmuteall = ImageAsset(name: "voiceroom_setting_unmuteall")
    public static let whiteQuiteIcon = ImageAsset(name: "white_quite_icon")
    public static let beginLiveVideoButtonBg = ImageAsset(name: "begin_live_video_button_bg")
    public static let callSwitchMic = ImageAsset(name: "call_switch_mic")
    public static let chatAddPicture = ImageAsset(name: "chat_add_picture")
    public static let createLiveRoomBg = ImageAsset(name: "create_live_room_bg")
    public static let defaultAvatar = ImageAsset(name: "default_avatar")
    public static let floatingClose = ImageAsset(name: "floating_close")
    public static let giftArrowDown = ImageAsset(name: "gift_arrow_down")
    public static let giftArrowUp = ImageAsset(name: "gift_arrow_up")
    public static let giftDiamond = ImageAsset(name: "gift_diamond")
    public static let giftIcon1 = ImageAsset(name: "gift_icon_1")
    public static let giftIcon10 = ImageAsset(name: "gift_icon_10")
    public static let giftIcon2 = ImageAsset(name: "gift_icon_2")
    public static let giftIcon3 = ImageAsset(name: "gift_icon_3")
    public static let giftIcon4 = ImageAsset(name: "gift_icon_4")
    public static let giftIcon5 = ImageAsset(name: "gift_icon_5")
    public static let giftIcon6 = ImageAsset(name: "gift_icon_6")
    public static let giftIcon7 = ImageAsset(name: "gift_icon_7")
    public static let giftIcon8 = ImageAsset(name: "gift_icon_8")
    public static let giftIcon9 = ImageAsset(name: "gift_icon_9")
    public static let giftValue = ImageAsset(name: "gift_value")
    public static let likeGift1 = ImageAsset(name: "like_gift_1")
    public static let likeGift10 = ImageAsset(name: "like_gift_10")
    public static let likeGift2 = ImageAsset(name: "like_gift_2")
    public static let likeGift3 = ImageAsset(name: "like_gift_3")
    public static let likeGift4 = ImageAsset(name: "like_gift_4")
    public static let likeGift5 = ImageAsset(name: "like_gift_5")
    public static let likeGift6 = ImageAsset(name: "like_gift_6")
    public static let likeGift7 = ImageAsset(name: "like_gift_7")
    public static let likeGift8 = ImageAsset(name: "like_gift_8")
    public static let likeGift9 = ImageAsset(name: "like_gift_9")
    public static let liveRoomClose = ImageAsset(name: "live_room_close")
    public static let liveSeatAdd = ImageAsset(name: "live_seat_add")
    public static let liveSeatAlertAdd = ImageAsset(name: "live_seat_alert_add")
    public static let logo = ImageAsset(name: "logo")
    public static let liveVideoMixDefault = ImageAsset(name: "live_video_mix_default")
    public static let liveVideoMixGrid2 = ImageAsset(name: "live_video_mix_grid_2")
    public static let liveVideoMixGrid3 = ImageAsset(name: "live_video_mix_grid_3")
    public static let liveVideoMixGrid4 = ImageAsset(name: "live_video_mix_grid_4")
    public static let liveVideoMixGrid7 = ImageAsset(name: "live_video_mix_grid_7")
    public static let liveVideoMixGrid9 = ImageAsset(name: "live_video_mix_grid_9")
    public static let liveVideoMixOneSix = ImageAsset(name: "live_video_mix_one_six")
    public static let rcLogo = ImageAsset(name: "rc_logo")
    public static let room = ImageAsset(name: "room")
    public static let roomCounting = ImageAsset(name: "room_counting")
    public static let sceneRoomSettingEffect = ImageAsset(name: "scene_room_setting_effect")
    public static let sceneRoomSettingMakeup = ImageAsset(name: "scene_room_setting_makeup")
    public static let sceneRoomSettingRetouch = ImageAsset(name: "scene_room_setting_retouch")
    public static let sceneRoomSettingSticker = ImageAsset(name: "scene_room_setting_sticker")
    public static let sceneRoomSettingSwitchCamera = ImageAsset(name: "scene_room_setting_switch_camera")
    public static let videoThumbEditIcon = ImageAsset(name: "video_thumb_edit_icon")
    public static let videoTypeSelected = ImageAsset(name: "video_type_selected")
    public static let videoTypeUnselected = ImageAsset(name: "video_type_unselected")
    public static let voiceVolumeTube1 = ImageAsset(name: "voice_volume_tube-1")
    public static let voiceVolumeTube = ImageAsset(name: "voice_volume_tube")
  }
  public enum Colors {
    public static let hex03062F = ColorAsset(name: "Hex03062F")
    public static let hex505DFF = ColorAsset(name: "Hex505DFF")
    public static let hexCDCDCD = ColorAsset(name: "HexCDCDCD")
    public static let hexDFDFDF = ColorAsset(name: "HexDFDFDF")
    public static let hexE92B88 = ColorAsset(name: "HexE92B88")
    public static let hexEF499A = ColorAsset(name: "HexEF499A")
    public static let hexF8E71C = ColorAsset(name: "HexF8E71C")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = RCSCBundle.sharedBundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = RCSCBundle.sharedBundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = RCSCBundle.sharedBundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = RCSCBundle.sharedBundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = RCSCBundle.sharedBundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
