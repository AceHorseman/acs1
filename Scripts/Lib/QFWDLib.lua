QFWDlib = {};
QFWDlib.HaveIn = false;
function QFWDlib.OnInit()
    -- QFWDlib.WorldLuaHelper = CS.WorldLuaHelper();
    -- QFWDlib.WorldLuaHelper:ShowMsgBox("True!","异常");
    -- print("false")
    if QFWDlib.HaveIn then return false; end
    -- print("true")
    QFWDlib.MoodListDisplayName = {};
    QFWDlib.MoodListTrue = {};
    QFWDlib.MoodList = {
        "Temperature1", "Temperature2", "Temperature3", "Temperature4",
        "Temperature5", "Temperature6", "Temperature7", "Temperature8",
        "Temperature9", "Light1", "Light2", "Light3", "Light4", "Light5",
        "Light6", "Pain1", "Pain2", "Pain3", "Pain4", "Pain5", "Consciousness1",
        "Consciousness2", "Consciousness3", "Consciousness4", "GetWet",
        "DevilBlood", "DevilBlood_Satisfy", "DevilBlood_LianHun",
        "AfterAbsorbGong_6", "BaseExpect1", "BaseExpect2", "BaseExpect3",
        "BedroomExpect1", "BedroomExpect2", "BedroomExpect3", "BedroomExpect4",
        "BedroomExpect5", "BedroomExpect6", "BedroomExpect7", "BedroomExpect8",
        "IndependentRoomNeed", "LiveWithBadMan", "BedroomFengShuiExpect1",
        "BedroomFengShuiExpect2", "BedroomFengShuiExpect3",
        "BedroomFengShuiExpect4", "BedroomFengShuiExpect5", "BedroomExpect9",
        "BedroomExpect10", "ClosedRoom", "ClothesExpect1", "ClothesExpect2",
        "ClothesExpect3", "BeautyExpect1", "BeautyExpect2", "BeautyExpect3",
        "BeautyExpect4", "BeautyExpect5", "BeautyExpect6", "NeedFabao",
        "NeedWeapon", "Drink1", "Dan_Happiness", "Eat1", "Eat2", "Eat3", "Eat4",
        "Eat5", "Eat6", "Eat7", "Eat8", "Eat9", "Eat10", "Eat11", "Eat12",
        "Sleep1", "Sleep2", "Sleep8", "Sleep3", "Sleep4", "Sleep5", "Sleep6",
        "Sleep7", "Work", "FavoriteWork", "SocialContact9", "SocialContact14",
        "SocialContact15", "SocialContact1", "SocialContact2", "SocialContact3",
        "SocialContact4", "SocialContact5", "SocialContact6", "SocialContact7",
        "SocialContact8", "SocialContact10", "SocialContact11",
        "SocialContact12", "SocialContact13", "SocialContact16",
        "SocialContact17", "Death1", "Death2", "Death3", "Death4", "Death5",
        "Death6", "Death7", "Death8", "TaoismPractice1", "TaoismPractice2",
        "TaoismPractice3", "TaoismPractice4", "TaoismPractice5",
        "TaoismPractice6", "MakeArt", "Health1", "Health2", "Health3",
        "SeeSomething1", "SeeSomething2", "NotBury", "SayHi", "AfterTalk",
        "DeepTalk", "Neglect", "Quarrel", "Insult", "SayHiFight",
        "AfterTalkFight", "DeepTalkFight", "NeglectFight", "QuarrelFight",
        "InsultFight", "Fighting", "BuildBody", "FailInLove", "SleepWithWhat",
        "StayWithGood", "SleepWithSpouse", "SleepWithLover",
        "FoundOrganization1", "FoundOrganization2", "FoundOrganization3",
        "BeSchoolMaster", "INeedTrousersM", "INeedClothesF", "INeedTrousersF",
        "Kick1", "Kick2", "Kick3", "Kick4", "Kick5", "Kick6", "Kick7",
        "Defection1", "Defection2", "Defection3", "Defection4", "Defection5",
        "DiscontentMood", "Mood_BasePracticeAchievements1",
        "Mood_BasePracticeAchievements2", "BecomeDisciple", "SeeGod",
        "TerribleThing1", "TerribleThing2", "TerribleThing3", "TerribleThing4",
        "TerribleThing5", "TerribleThing6", "NiceThing1", "NiceThing1_1",
        "NiceThing2", "NiceThing2_1", "NiceThing3", "NiceThing4", "NiceThing5",
        "Mood_LingStone", "Mood_LingStone1", "Mood_Equipment_Fun",
        "Mood_PracticeFoodScanty", "SeeBodyPuppet", "Illusion1", "Illusion2",
        "BeResurrection", "PaoZhang1", "PaoZhang2", "Optimistic", "Pessimism",
        "Depressed", "Regret", "BottleNeck1", "BottleNeck2", "BottleNeck3",
        "BottleNeck4", "BottleNeck5", "ThunderDisaster1", "ThunderDisaster2",
        "ThunderDisaster3", "Dan1", "Dan2", "Dan3", "Dan4", "StageUp",
        "FrameOfMind1", "FrameOfMind2", "FrameOfMind3", "FrameOfMind4",
        "FrameOfMind5", "FrameOfMind6", "TravelExperience", "SitCrosslegged1",
        "SitCrosslegged2", "PracticeLing1", "PracticeLing2", "PracticeLing3",
        "PracticeLing4", "PracticeElement1", "PracticeElement2",
        "PracticeElement3", "PracticeElement4", "Happy1", "Happy2", "Happy3",
        "Happy4", "Happy5", "Happy6", "Happen1", "Happen2", "Happen3",
        "Happen4", "Magic1", "Magic2", "ZhenkongJie", "FengShui1", "FengShui2",
        "FengShui3", "FengShui4", "FengShui5", "Tool_PerfectWorld",
        "Mood_Tool_LunHui_QiYuan", "Dan_LunHui1", "Mood_Item_Laxative",
        "Mood_LunHui_ShiYi", "Mood_LunHui_XinNian", "Mood_GreenBrothel",
        "Hungry1", "Hungry2", "Hungry3", "Hungry4"

    };

    QFWDlib.ExperienceListDisplayName = {};
    QFWDlib.ExperienceListTrue = {};

    QFWDlib.FeatureListDisplayName = {};
    QFWDlib.FeatureListTrue = {};
    QFWDlib.FeatureList = {
        -- "BanSpouse","BanParents","BanChild","BanLove",
        -- "NoHeavyWork","FacialScar","FacialScar","UglyFace1",
        -- "UglyFace2","OldViscusInjury","BeautifulFace2","OldViscusInjury",
        -- "CrippleLeft","BanLeftScapula","BanLeftTibia","BanRightTibia",
        -- "BanLeftScapula","BanLeftEar","Deaf","BanLeftEye",
        -- "BanRightEye","HealthMaintain1","BanRightEar","MeridianIncomplete",
        -- "HealthOverdraft1","HighMan","HealthMaintain1","HealthMaintain2",
        -- "ColdPatience","BanRightMiddleFinger","DarkPatience","HighMan",
        -- "LowMan","ShallowSleep","LeftHanded","Mute",
        -- "BanRightMiddleFinger","Enthusiasm","Indigestion","IronStomach",
        -- "GoodEyesight","GoodMentality","Pessimism","Optimistic",
        -- "Numbness","Feminization","Enthusiasm","Distrust",
        -- "Strong","Depressed","BadMentality","GoodMentality",
        -- "Rugged","CraftsmanEX","Lazy","Industrious",
        -- "Feminization","YinBody","Affinity","Cruel",
        -- "HeartKnot","DemonBlood","Anatman","FearFlame",
        -- "Reader","LunHui_3","CraftsmanEX","Artist",
        -- "Warrior","LunHui_8","SonOfDestiny","YinBody",
        -- "YangBody","LunHui_13","Slovenly","DragonBlood",
        -- "DemonBlood","LunHui_18","Retarded","LunHui_1",
        -- "LunHui_2","LunHui_23","LunHui_4","LunHui_5",
        -- "LunHui_6","LunHui_28","LunHui_8","LunHui_9",
        -- "LunHui_10","LunHui_33","LunHui_12","LunHui_13",
        -- "LunHui_14","LunHui_38","LunHui_16","LunHui_17",
        -- "LunHui_18","LunHui_43","LunHui_20","LunHui_21",
        -- "LunHui_22","LunHui_48","LunHui_24","LunHui_25",
        -- "LunHui_26","LunHui_53","LunHui_28","LunHui_29",
        -- "LunHui_30","LunHui_58","LunHui_32","LunHui_33",
        -- "LunHui_34","LunHui_63","LunHui_36","LunHui_37",
        -- "LunHui_38","LunHui_Kong_1","LunHui_40","LunHui_41",
        -- "LunHui_42","LunHui_Kong_6","LunHui_44","LunHui_45",
        -- "LunHui_46","LunHui_Kong_11","LunHui_48","LunHui_49",
        -- "LunHui_50","Sys_YuSheTeXing1","LunHui_52","LunHui_53",
        -- "LunHui_54","Sys_Disciple","LunHui_56","LunHui_57",
        -- ,"LunHui_58","LunHui_59","LunHui_60","LunHui_61",
        -- "LunHui_62","LunHui_63","LunHui_64","LunHui_65",
        -- "LunHui_66","LunHui_67","LunHui_Kong_1","LunHui_Kong_2",
        -- "LunHui_Kong_3","LunHui_Kong_4","LunHui_Kong_5","LunHui_Kong_6",
        -- "LunHui_Kong_7","LunHui_Kong_8","LunHui_Kong_9","LunHui_Kong_10",
        -- "LunHui_Kong_11","LunHui_Kong_12","LunHui_Kong_13","LunHui_Kong_14",
        -- "LunHui_Kong_15","Sys_YuSheTeXing1","Sys_YuSheTeXing2","Sys_YuSheTeXing3",
        -- "Sys_YuSheTeXing4","SYS_LOST","Sys_Disciple","Sys_Worker"
    };
    QFWDlib.ModifierListTrue = {};
    QFWDlib.ModifierList = {
        "Boss_PartFight", "Boss_Jiaolong", "Boss_JiaolongFight",
        "Boss_Jiaolong_Part", "Boss_Jiaolong_Part1",
        "Boss_Jiaolong_JiSiGongYang", "Boss_Jiaolong_Shuiling",
        "Boss_Jiaolong_LongNu", "Boss_Jiaolong_Longxi",
        "Boss_Jiaolong_zhenlong", "Boss_Jiaolong_fanshi", "Boss_Xiongfeng",
        "Boss_XiongfengFight", "Boss_Xiongfeng_Part", "Boss_Xiongfeng_huoling",
        "Boss_Xiongfeng_Huofeng", "Boss_Xiongfeng_rongjin",
        "Boss_Xiongfeng_yishang", "Boss_Xiongfeng_taiyangzhiyan",
        "Boss_Zhulong", "Boss_ZhulongFight", "Boss_Zhulong_ShadowFight",
        "Boss_Zhulong_YangShadow", "Boss_Zhulong_YinShadow",
        "Boss_Zhulong_LongPuFix", "Boss_ZhuLong_Part", "Boss_ZhulongShadow",
        "Boss_Zhulong_NightGod", "Boss_Zhulong_Night", "Boss_Zhulong_DayGod",
        "Boss_Zhulong_Day", "Boss_Zhulong_OnlyYingDamage",
        "Boss_Zhulong_OnlyYangDamage", "Boss_Zhulong_Shennian",
        "Boss_Zhulong_Zuinie", "Boss_Zhulong_yehuocanshen",
        "Boss_Zhulong_yehuocanshen_end", "Boss_Zhulong_xinlingzezao",
        "Boss_Zhulong_xinlingzezao_end", "Boss_ZhulongIdleEffect",
        "GodCityBuiling_Housing_lv1", "GodCityBuiling_Housing_lv2",
        "GodCityBuiling_Housing_lv3", "GodCityBuiling_Housing_lv4",
        "GodCityBuiling_Housing_lv5", "GodCityBuiling_Housing_lv6",
        "GodCityBuiling_Housing_lv7", "GodCityBuiling_Housing_lv8",
        "GodCityBuiling_Housing_lv9", "GodCityBuiling_Housing_lv10",
        "GodCityBuiling_WishTree", "GodCityBuiling_HongChenKuHai",
        "GodCityBuiling_XinYangShenDian_Lv1",
        "GodCityBuiling_XinYangShenDian_Lv2",
        "GodCityBuiling_XinYangShenDian_Lv3", "GodCityBuiling_ThunderDefend",
        "GodCityBuiling_CoreHousing", "GodPractice_GodPowerEffect",
        "GodPractice_GodPowerEffect_A", "GodPractice_GodPowerEffect_B",
        "GodPractice_Xinzhai", "GodPractice_GodLike",
        "Modifier_Sys_XinYang_KeJi", "Modifier_Sys_XinYang_ZongYu",
        "GodPractice_Gong_Qi", "GodPractice_Gong_GodCity",
        "GodPractice_Gong_God", "GodPractice_Gong1_1", "GodPractice_Gong1_2",
        "GodPractice_Gong1_3", "GodPractice_Gong2_1", "GodPractice_Gong2_2",
        "GodPractice_Gong2_3", "GodPractice_Gong2_4", "GodPractice_Gong2_5",
        "GodPractice_Gong2_6", "GodPractice_Gong2_7", "GodPractice_Gong2_8",
        "GodPractice_Gong3_1", "GodPractice_Gong3_2", "GodPractice_Gong3_3",
        "GodPractice_Gong3_4", "Modifier_Guard_LeiBu_1",
        "Modifier_Guard_LeiBu_2", "Modifier_Guard_LeiBu_3",
        "Modifier_Guard_LeiBu_4", "Modifier_Guard_LeiBu_5",
        "Modifier_Guard_LeiBu_6", "Modifier_Guard_LeiBu_7",
        "Modifier_Guard_LeiBu_8", "Modifier_Guard_LeiBu_9",
        "Modifier_Guard_BaBuZhong_1", "Modifier_Guard_BaBuZhong_2",
        "Modifier_Guard_BaBuZhong_3", "Modifier_Guard_BaBuZhong_4",
        "Modifier_Guard_BaBuZhong_5", "Modifier_Guard_BaBuZhong_6",
        "Modifier_Guard_BaBuZhong_7", "Modifier_Guard_BaBuZhong_8",
        "Modifier_Guard_YouMing_1", "Modifier_Guard_YouMing_2",
        "Modifier_Guard_YouMing_3", "Modifier_Guard_YouMing_4",
        "Modifier_Guard_YouMing_5", "Modifier_Guard_YouMing_6",
        "Modifier_Guard_YouMing_7", "Modifier_Guard_Other_1",
        "Modifier_Guard_Other_2", "Modifier_Guard_Other_3",
        "Modifier_Guard_Other_4", "Modifier_Guard_Other_5",
        "Modifier_Guard_Other_6", "Modifier_Guard_Other_7",
        "Modifier_Guard_Other_8", "Modifier_Guard_Other_9",
        "Modifier_Guard_Other_10", "Modifier_Guard_Other_11",
        "Modifier_Guard_Other_12", "Modifier_Guard_Base_1",
        "Modifier_Guard_Base_2", "Modifier_Guard_Base_3",
        "Modifier_Guard_Base_4", "Modifier_Guard_Base_5",
        "Modifier_Guard_Base_6", "Modifier_Guard_Base_7",
        "Modifier_Guard_Base_8", "Modifier_Guard_Base_9",
        "Modifier_Guard_Base_10", "Modifier_Guard_Base_11",
        "Modifier_Guard_Base_12", "Modifier_Guard_Base_13",
        "Modifier_Guard_Base_14", "Modifier_Guard_Base_15",
        "Modifier_Guard_Base_16", "Modifier_Guard_Base_17",
        "Modifier_Guard_Base_18", "Modifier_Guard_Base_19",
        "Modifier_Guard_Base_20", "Modifier_Guard_Base_21",
        "Modifier_Guard_Base_22", "Dan_BasePracticeDrug",
        "Modifier_Dan_JingYuan", "Modifier_Dan_JingYuan2",
        "Modifier_Dan_JingYuan3", "Dan_Ling1", "Dan_Ling2", "Dan_Ling3",
        "Dan_Defense", "Dan_FiveBaseFromLife", "Dan_FiveBase1", "Dan_FiveBase2",
        "Dan_FiveBase3", "Dan_FiveBase4", "Dan_FiveBase5", "Dan_PracticeRate",
        "Dan_PracticeSpeed", "Dan_HundredRefine", "Dan_CalmDown",
        "Dan_Happiness", "Dan_NoHunger", "Dan_NoHunger1", "Dan_NoHunger2",
        "Dan_LostSoul", "Dan_IncreaseLife1", "Dan_IncreaseLife2",
        "Dan_IncreaseLife3", "Dan_IncreaseLife4", "Dan_IncreaseLife5",
        "Dan_IncreaseLife6", "Dan_IncreaseLife7", "Dan_IncreaseLife8",
        "Modifier_Item_Anodyne", "Modifier_Item_Mint",
        "Modifier_Item_EarthEssence", "Modifier_Item_EarthEssence1",
        "Modifier_Item_EarthEssence_1", "Modifier_Item_EarthEssence1_1",
        "Modifier_Item_Ginseng", "Modifier_Item_RedGinseng",
        "Modifier_Item_RedGinseng1", "Modifier_Item_Laxative",
        "Modifier_Item_Laxative1", "Modifier_Item_LongXianGuo",
        "Modifier_Item_LingWater", "Dan_LingStone", "Dan_LingCrystal",
        "Dan_IncreaseNeckCountdown1", "Dan_IncreaseNeckCountdown2", "Dan_Fail1",
        "Dan_Fail2", "Dan_Fail3", "Dan_Fail4", "Dan_Fail5", "Dan_Soul1",
        "Dan_Soul2", "Dan_Soul3", "Dan_Soul4", "Dan_Soul4_D", "Dan_LunHui1",
        "Dan_XianBone", "Dan_XianBoneBall", "Dan_LingYuanZhong",
        "Dan_LingYuanZhong_Equip", "Modifier_Item_YuanHunLu",
        "Modifier_Item_XieHunLu", "Modifier_Item_XieHunLu1",
        "Modifier_Item_YanDaoGuo", "Modifier_Item_QieDaoGuo",
        "Modifier_Item_ZaoHuaYuLu", "Modifier_Item_ZaoHuaYuLu1",
        "Modifier_Item_XianShiChongSheng", "Modifier_Item_XieShiChongSheng",
        "Modifier_Item_Boss_Meat", "Modifier_Item_BossZhuLong_Meat",
        "Modifier_Item_Dan_FabaoNumAdd", "Modifier_Dan_LieShenDan",
        "Modifier_Dan_TiShen", "FeatureModifierBase", "ExperienceModifierBase",
        "FeatureModifier_DongShiZhang1", "FeatureModifier_DongShiZhang2",
        "NI_FSZhenWu", "SHUN_FSZhenWu", "FSZhenWu_1", "FSZhenWu_2",
        "FSZhenWu_3", "FSZhenWu_4", "FSZhenWu_5", "FSZhenWu_6", "FSZhenWu_7",
        "FSZhenWu_8", "FSZhenWu_9", "FSZhenWu_10", "FSZhenWu_11", "FSZhenWu_12",
        "FSZhenWu_13", "FSZhenWu_14", "FSZhenWu_15", "FSZhenWu_16",
        "FSZhenWu_17", "FSZhenWu_18", "FSZhenWu_19", "FSZhenWu_20",
        "FSZhenWu_21", "FSZhenWu_22", "FSZhenWu_23", "FSZhenWu_24",
        "FSZhenWu_25", "FSZhenWu_26", "FSZhenWu_27", "FSZhenWu_28",
        "FSZhenWu_29", "FSZhenWu_30", "FSZhenWu_31", "FSZhenWu_32",
        "FSZhenWu_33", "FSZhenWu_34", "FSZhenWu_35", "FSZhenWu_36",
        "FSZhenWu_37", "FSZhenWu_38", "FSZhenWu_39", "FSZhenWu_40",
        "FSZhenWu_41", "FSZhenWu_42", "FSZhenWu_43", "FSZhenWu_44",
        "FSZhenWu_45", "FSZhenWu_46", "FSZhenWu_47", "FSZhenWu_48",
        "FSZhenWu_49", "FSZhenWu_50", "FSZhenWu_51", "FSZhenWu_52",
        "FSZhenWu_53", "FSZhenWu_54", "FSZhenWu_55", "FSZhenWu_56",
        "FSZhenWu_57", "FSZhenWu_58", "FSZhenWu_59", "FSZhenWu_60",
        "FSZhenWu_61", "FSZhenWu_62", "SP_FSZhenWu_1a", "SP_FSZhenWu_1b",
        "SP_FSZhenWu_1c", "SP_FSZhenWu_2", "SP_FSZhenWu_3", "SP_FSZhenWu_4",
        "SP_FSZhenWu_5", "SP_FSZhenWu_6", "SP_FSZhenWu_7", "SP_FSZhenWu_8",
        "SP_FSZhenWu_9", "SP_FSZhenWu_10", "SP_FSZhenWu_11", "SP_FSZhenWu_12",
        "SP_FSZhenWu_13", "SP_FSZhenWu_14", "SP_FSZhenWu_15", "SP_FSZhenWu_16",
        "Gong_Qi", "Gong_Gold", "Gong_Thunder1", "Gong_Thunder2",
        "Gong_Thunder3", "Gong9_1_1", "Gong9_1_2", "Gong9_1_3", "Gong9_2_1",
        "Gong9_2_2", "Gong9_2_3", "Gong9_3_1", "Gong9_3_2", "Gong9_3_3",
        "Gong9_4_1", "Gong9_4_2", "Gong9_4_3", "Gong9_5_1", "Gong9_5_2",
        "Gong9_5_3", "Gong9_6_1", "Gong9_6_2", "God2_Fabao",
        "Gong1_Esoterica_1", "Gong1_Esoterica_2", "Gong1_Esoterica_3",
        "Gong1_Esoterica_4", "Gong1_Esoterica_5", "Gong1_Esoterica_6",
        "Gong1_Esoterica_7", "Gong1_Esoterica_8", "Gong1_Esoterica_9",
        "Gong2_Esoterica_1", "Gong2_Esoterica_2", "Gong2_Esoterica_3",
        "Gong2_Esoterica_4", "Gong2_Esoterica_5", "Gong2_Esoterica_6",
        "Gong2_Esoterica_7", "Gong2_Esoterica_8", "Gong2_Esoterica_9",
        "Gong2_Esoterica_10", "Gong3_Esoterica_1", "Gong3_Esoterica_2",
        "Gong3_Esoterica_3", "Gong3_Esoterica_4", "Gong3_Esoterica_5",
        "Gong3_Esoterica_6", "Gong3_Esoterica_7", "Gong3_Esoterica_8",
        "Gong3_Esoterica_9", "Gong3_Esoterica_10", "Gong3_Esoterica_11",
        "Gong3_Esoterica_12", "Gong3_Esoterica_13", "Gong3_Esoterica_14",
        "Gong3_Esoterica_15", "Gong3_Esoterica_16", "Gong3_Esoterica_17",
        "Gong3_Esoterica_18", "Gong3_Esoterica_19", "Gong4_Esoterica_1",
        "Gong4_Esoterica_2", "Gong4_Esoterica_3", "Gong4_Esoterica_4",
        "Gong4_Esoterica_5", "Gong4_Esoterica_6", "Gong4_Esoterica_7",
        "Gong4_Esoterica_8", "Gong4_Esoterica_9", "Gong4_Esoterica_10",
        "Gong4_Esoterica_11", "Gong4_Esoterica_12", "Gong5_Esoterica_1",
        "Gong5_Esoterica_2", "Gong5_Esoterica_3", "Gong5_Esoterica_4",
        "Gong5_Esoterica_5", "Gong5_Esoterica_6", "Gong5_Esoterica_7",
        "Gong5_Esoterica_8", "Gong5_Esoterica_9", "Gong5_Esoterica_10",
        "Gong5_Esoterica_11", "Gong5_Esoterica_12", "Gong6_Esoterica_1",
        "Gong6_Esoterica_2", "Gong6_Esoterica_3", "Gong6_Esoterica_4",
        "Gong6_Esoterica_5", "Gong6_Esoterica_6", "Gong6_Esoterica_7",
        "Gong6_Esoterica_8", "Gong6_Esoterica_9", "Gong6_Esoterica_10",
        "Gong6_Esoterica_11", "Gong6_Esoterica_12", "Gong6_Esoterica_13",
        "Gong6_Esoterica_14", "Gong7_Esoterica_1", "Gong7_Esoterica_2",
        "Gong7_Esoterica_3", "Gong7_Esoterica_4", "Gong7_Esoterica_5",
        "Gong7_Esoterica_6", "Gong7_Esoterica_7", "Gong7_Esoterica_8",
        "Gong7_Esoterica_9", "Gong7_Esoterica_10", "Gong7_Esoterica_11",
        "Gong7_Esoterica_12", "Gong7_Esoterica_13", "Gong8_Esoterica_1",
        "Gong8_Esoterica_2", "Gong8_Esoterica_3", "Gong8_Esoterica_4",
        "Gong8_Esoterica_5", "Gong8_Esoterica_6", "Gong8_Esoterica_7",
        "Gong8_Esoterica_8", "Gong8_Esoterica_9", "Gong8_Esoterica_10",
        "Gong8_Esoterica_11", "Gong8_Esoterica_12", "Gong8_Esoterica_13",
        "Gong9_Esoterica_1", "Gong9_Esoterica_2", "Gong9_Esoterica_3",
        "Gong9_Esoterica_4", "Gong9_Esoterica_5", "Gong9_Esoterica_6",
        "Gong9_Esoterica_7", "Gong9_Esoterica_8", "Gong9_Esoterica_9",
        "Gong9_Esoterica_10", "Gong9_Esoterica_11", "Gong9_Esoterica_12",
        "Gong9_Esoterica_13", "Gong9_Esoterica_14", "Gong10_Esoterica_1",
        "Gong10_Esoterica_2", "Gong10_Esoterica_3", "Gong10_Esoterica_4",
        "Gong10_Esoterica_5", "Gong10_Esoterica_6", "Gong10_Esoterica_7",
        "Gong10_Esoterica_8", "Gong10_Esoterica_9", "Gong10_Esoterica_10",
        "Gong10_Esoterica_11", "Gong11_Esoterica_1", "Gong11_Esoterica_2",
        "Gong11_Esoterica_3", "Gong11_Esoterica_4", "Gong11_Esoterica_5",
        "Gong11_Esoterica_6", "Gong11_Esoterica_7", "Gong11_Esoterica_8",
        "Gong11_Esoterica_9", "Gong11_Esoterica_10", "Gong11_Esoterica_11",
        "Gong11_Esoterica_12", "Gong11_Esoterica_13", "Gong11_Esoterica_14",
        "Gong11_Esoterica_15", "Gong11_Esoterica_16", "Gong12_Esoterica_8",
        "Gong12_Esoterica_9", "Gong12_Esoterica_10", "Gong12_Esoterica_11",
        "Gong1_LvUpEsoterica_4", "Gong1_LvUpEsoterica_5",
        "Gong1_LvUpEsoterica_7", "Gong1_LvUpEsoterica_8",
        "Gong8_LvUpEsoterica_1", "Gong8_LvUpEsoterica_8",
        "Gong8_LvUpEsoterica_10", "Gong8_LvUpEsoterica_11",
        "Gong9_LvUpEsoterica_4", "Gong9_LvUpEsoterica_6",
        "Gong9_LvUpEsoterica_9", "Gong9_LvUpEsoterica_7",
        "Gong9_LvUpEsoterica_10", "Gong9_LvUpEsoterica_8",
        "Gong9_LvUpEsoterica_11", "Gong10_LvUpEsoterica_1",
        "Gong10_LvUpEsoterica_2", "Gong10_LvUpEsoterica_5",
        "Gong10_LvUpEsoterica_6", "Gong10_LvUpEsoterica_7",
        "Gong11_LvUpEsoterica_1", "Gong11_LvUpEsoterica_2",
        "Gong11_LvUpEsoterica_3", "Gong11_LvUpEsoterica_5",
        "Gong11_LvUpEsoterica_6", "Gong11_LvUpEsoterica_7",
        "Gong11_LvUpEsoterica_8", "Gong11_LvUpEsoterica_9",
        "Gong11_LvUpEsoterica_10", "Gong11_LvUpEsoterica_11",
        "Gong11_LvUpEsoterica_12", "Gong2_LvUpEsoterica_1",
        "Gong2_LvUpEsoterica_2", "Gong2_LvUpEsoterica_4",
        "Gong2_LvUpEsoterica_5", "Gong2_LvUpEsoterica_6",
        "Gong2_LvUpEsoterica_7", "Gong2_LvUpEsoterica_8",
        "Gong3_LvUpEsoterica_1", "Gong3_LvUpEsoterica_3",
        "Gong3_LvUpEsoterica_5", "Gong3_LvUpEsoterica_6",
        "Gong4_LvUpEsoterica_3", "Gong4_LvUpEsoterica_4",
        "Gong4_LvUpEsoterica_5", "Gong4_LvUpEsoterica_6",
        "Gong4_LvUpEsoterica_7", "Gong4_LvUpEsoterica_8",
        "Gong4_LvUpEsoterica_9", "Gong4_LvUpEsoterica_10",
        "Gong5_LvUpEsoterica_1", "Gong5_LvUpEsoterica_2",
        "Gong5_LvUpEsoterica_3", "Gong5_LvUpEsoterica_4",
        "Gong5_LvUpEsoterica_5", "Gong5_LvUpEsoterica_7",
        "Gong6_LvUpEsoterica_1", "Gong6_LvUpEsoterica_2",
        "Gong6_LvUpEsoterica_3", "Gong6_LvUpEsoterica_4",
        "Gong7_LvUpEsoterica_1", "Gong7_LvUpEsoterica_2",
        "Gong7_LvUpEsoterica_4", "Gong7_LvUpEsoterica_5",
        "HotStory_SocialContactLv", "HotStory_MedicineLv", "HotStory_CookingLv",
        "HotStory_BuildingLv", "HotStory_FarmingLv", "HotStory_ManualLv",
        "HotStory_MiningLv", "HotStory_ArtLv", "HotStory_QiLv",
        "HotStory_FabaoLv", "HotStory_FightSkillLv", "HotStory_MakeBigSuccess",
        "HotStory_BrokeningChance", "HotStory_Ling", "HotStory_DanNum",
        "HotStory_FabaoQ", "HotStory_FabaoR", "Modifier_LingZhi_DiaoXie",
        "Modifier_LingZhi_GT0_Jin", "Modifier_LingZhi_LT0_Jin",
        "Modifier_LingZhi_GT0_Mu", "Modifier_LingZhi_LT0_Mu",
        "Modifier_LingZhi_GT0_Shui", "Modifier_LingZhi_LT0_Shui",
        "Modifier_LingZhi_GT0_Huo", "Modifier_LingZhi_LT0_Huo",
        "Modifier_LingZhi_GT0_Tu", "Modifier_LingZhi_LT0_Tu",
        "Story_LingZhi_XinJing1", "Story_LingZhi_XinJing2",
        "Story_LingZhi_MaxLing1", "Story_LingZhi_RipeLing1",
        "Story_LingZhi_RipeLing2", "Story_LingZhi_RipeLing3",
        "Story_LingZhi_RipeLing4", "Story_LingZhi_RipeLing5",
        "Story_LingZhi_RipeLing_A", "Story_LingZhi_RipeSha", "Gong_SnatchBody",
        "Gong_LifeBurning", "Gong_LifeBurning_End", "Gong_DevilBlood",
        "Gong_DevilBlood_LianHun", "Gong_HunTin_Self", "Gong_TaHua_Self",
        "Gong_TaHua_Self1", "Gong_TianMoWu", "Gong_SoulKeYin",
        "Modifier_GongXinYin_Damage", "WuYinKeShenRestore", "TianMoWuRestore",
        "Story_PracticeSpeed1", "Story_LingMax1", "Story_FabaoPower1",
        "Story_LingAbsorbSpeed1", "Story_WorldMapFlySpeedAddP1",
        "Story_ShieldConversionRate1", "Story_DragonBlood",
        "Modifier_Story_BossLong_Wish1", "Modifier_Story_BossLong_Wish2",
        "Modifier_Story_BossLong_Wish3", "Modifier_Story_BossLong_Wish4",
        "Modifier_GreenBrothel", "Esoterica_LunHui1", "Esoterica_LunHui2",
        "Esoterica_LunHui4", "Other_Esoterica_DanXia1",
        "Other_Esoterica_DanXia2", "Other_Esoterica_DengXian1",
        "Other_Esoterica_JiuHua", "Other_Esoterica_LongHu1",
        "Other_Esoterica_LongHu2", "Other_Esoterica_ChiLianYuan",
        "Other_Esoterica_ChiLianYuan1", "Other_Esoterica_XuanKong",
        "Other_Esoterica_YanHuangTongShi", "Lingzhi_Esoterica_JinLing",
        "Lingzhi_Esoterica_MuLing", "Lingzhi_Esoterica_ShuiLing",
        "Lingzhi_Esoterica_HuoLing", "Lingzhi_Esoterica_TuLing",
        "Lingzhi_Esoterica_JinSha", "Lingzhi_Esoterica_MuSha",
        "Lingzhi_Esoterica_ShuiSha", "Lingzhi_Esoterica_HuoSha",
        "Lingzhi_Esoterica_TuSha", "Esoterica_Boss_Long1",
        "Esoterica_Boss_Feng1", "Esoterica_Boss_ZhuLong1", "Modifier_WaitLeave",
        "Modifier_SpringBox", "Modifier_SpNpc_BasePropertie",
        "Modifier_SpNpc_BaseFightPropertie", "Modifier_SpNpc_Ling",
        "Modifier_SpNpc_Shield", "Modifier_SpNpc_FabaoAtk",
        "Modifier_SpNpc_FabaoLing", "Modifier_SpNpc_FabaoSpeed",
        "Modifier_SpNpc_FabaoDisp", "Modifier_SpNpc_FabaoNum",
        "Modifier_SpNpc_FightSkillAtk", "Modifier_SpNpc_FightSkillCD",
        "Modifier_SpNpc_Comeback", "Modifier_NomalNpc_BasePropertie_Qi",
        "Modifier_NomalNpc_BasePropertie_Dan1",
        "Modifier_NomalNpc_BasePropertie_Dan2",
        "Modifier_NomalNpc_BasePropertie_God", "Character_Initialization",
        "SysNpcPuppet", "SysInfiPuppet", "SysNewYearLink", "SysNewYear",
        "SysNewYear2", "SysExploreModifier", "SysCallUp", "SysDreamCantSleep",
        "SysDemonColdDown", "SysGodPractice", "SysTeacherModifier",
        "SysVistorModifier", "SysGodMonsterModifier", "SysFlyingModifier",
        "SysPracticeDie", "SysExploreEatModifier", "SysFabao_Positive",
        "SysFabao_Same", "SysFabao_Negative", "SysEndureHunger", "Illusion1",
        "Illusion2", "Illusion3", "Illusion4", "NegativeTime",
        "NegativeTime_Hearten", "Dissatisfaction", "SysDoBasePractice",
        "SysTooTired", "Sys_JieNanShenyu", "Sys_JieNanZhenkong",
        "Sys_JieNanHuangu", "Sys_WorkBroken", "Sys_MasterHelp", "Sys_DrugTime",
        "Sys_FabaoPowerAdd", "Sys_SkillPowerAdd", "Sys_SheildPowerAdd",
        "SeeGod", "BasePracticeAchievements1", "BasePracticeAchievements2",
        "BasePracticeAchievements3", "BasePracticeAchievements4", "Sys_Demon",
        "FengShui1", "FengShui2", "FengShui3", "FengShui4", "FengShui5",
        "FengShui6", "Sys_AbsorbGong_5", "Sys_AbsorbGong_6",
        "Sys_ShenXiu_Magic_JingXin", "Sys_DaoLv", "Sys_Zombie",
        "Sys_Jianglingfenshen", "Sys_Jianglingjiangdao",
        "Modifier_Sys_ZangMenDebuff", "Modifier_Sys_TangZhuDebuff",
        "Modifier_Sys_ZangMenDebuff_Old", "Modifier_Sys_TangZhuDebuff_Old",
        "Modifier_Sys_NoAreaBuff", "Modifier_Sys_NoAllBuff",
        "Modifier_Sys_Nei_Dan", "Modifier_Sys_Wai_Dan", "Modifier_Sys_All_Dan",
        "Modifier_Sys_Nei_Qi", "Modifier_Sys_Wai_Qi", "Modifier_Sys_All_Qi",
        "Modifier_Sys_Nei_Zhan", "Modifier_Sys_Wai_Zhan",
        "Modifier_Sys_All_Zhan", "Modifier_Sys_Nei_XiuLian",
        "Modifier_Sys_Wai_XiuLian", "Modifier_Sys_All_XiuLian",
        "Modifier_Sys_Nei_WaiShi", "Modifier_Sys_Wai_WaiShi",
        "Modifier_Sys_All_WaiShi", "Modifier_Sys_Magic_Prophesy",
        "Modifier_Sys_CanNotExperience", "Modifier_Sys_CanNotExperienceHide",
        "Modifier_Sys_TameCD", "Modifier_Sys_GodMode",
        "Modifier_Sys_CantSelect", "Mini_Follow", "Modifier_Sys_Fenshenshang",
        "SysConcealmentModifier", "SysConcealmentRobModifier",
        "Modifier_Sys_WinterWarm", "Modifier_Sys_SummerHerb",
        "Modifier_Sys_SuppressGodCall", "Modifier_Sys_CangJingGe",
        "Modifier_Sys_EnianHeart_ShaLu", "Modifier_Sys_EnianHeart_ZiQi",
        "Modifier_Sys_EnianHeart_TanLan", "Modifier_Sys_EnianHeart_XiangLe",
        "Modifier_Sys_EnianHeart_AoMan", "Modifier_Sys_EnianHeart_WeiShan",
        "Modifier_Sys_EnianHeart_JiaoLv", "Modifier_Sys_EnianHeart_YiYu",
        "SysNewYearZhulong", "SysTool_Fun1", "SysTool_Fun2", "SysTool_Fun3",
        "SysTool_Fun4", "SysTool_Fun5", "SysTool_WhiteHair", "SysTool_Axe",
        "SysTool_Pickaxe", "SysTool_Sickle", "SysTool_Acupuncture",
        "SysTool_Umbrella", "SysTool_LunHui1", "SysTool_LunHui_QiYuan1",
        "SysTool_LunHui_QiYuan2", "SysTool_SP_BaiYuShi",
        "SysTool_QingLianShan_SiXiang", "Modifier_Item_Yao_WolfAtk",
        "Modifier_Item_Yao_RabbitLuck", "Modifier_Item_Yao_SnakeHanLin",
        "Modifier_Item_Yao_BearPiMao", "Modifier_Item_Yao_TurtleKe",
        "Modifier_Item_DragonScale", "Modifier_Item_BossFeng_HuoYu",
        "Modifier_Item_BossFeng_TouYu", "Modifier_Item_BossLong_Jiao",
        "Modifier_Item_BossZhuLong_TianLin", "Modifier_Item_BossZhuLong_LongYu",
        "Modifier_Item_BossLong_NiLin", "Modifier_Item_BossFeng_HongYu",
        "Modifier_Item_TaiYiMiDian", "SysTool_StoneCutter",
        "SysTool_SewingDefender", "SysTool_MillVell", "Mibao_Yuanshenxinjian",
        "Mibao_Wuqileifu", "Mibao_Longxinyinyanggui",
        "Modifier_Item_XianBoneBall", "Mibao_GodFabaoYuQi",
        "Mibao_GodFabaoShuFa", "Mibao_GodFabaoHuTi",
        "Modifier_Item_SP_Clothes1", "Modifier_Item_SP_Clothes2",
        "Modifier_Item_SP_Clothes3", "Modifier_Item_SP_Clothes4",
        "Modifier_Item_SP_Clothes5", "Modifier_Item_SP_Clothes6",
        "Modifier_Item_SP_Clothes7", "Modifier_Item_SP_Clothes8",
        "Modifier_Item_SP_Clothes9", "Modifier_Item_SP_Clothes10",
        "Modifier_Item_SP_Trousers1", "Modifier_Item_SP_Trousers2",
        "Modifier_Item_SP_Trousers3", "Modifier_Item_SP_Trousers4",
        "Modifier_Item_SP_Trousers5", "Modifier_Item_SP_Trousers6",
        "Modifier_Item_SP_Trousers7", "Modifier_Item_SP_Trousers8",
        "Modifier_Item_SP_Trousers9", "Modifier_Item_SP_Trousers10",
        "Trade_Invincible", "Weather_SunnyDay", "Weather_Overcast",
        "Weather_LightRain", "Weather_HeavyRain", "Weather_LightSnow",
        "Weather_HeavySnow", "Weather_DenseFog", "Weather_SpringAir",
        "Weather_Melancholy", "Weather_HarvestAir", "Weather_Impetuous",
        "Weather_Hail", "Weather_MouldRains", "Weather_Drought",
        "Weather_Rainstorm", "Weather_Fohn", "Weather_DustStorm",
        "Weather_LingRarefiedWave", "Weather_LingUpWave", "Weather_HeatWave",
        "Weather_ColdWave", "Weather_HeatWaveInWinter",
        "Weather_ColdWaveInSummer", "Weather_PermanentNight", "Weather_Miasma",
        "Weather_LightningStorm", "Weather_LuShu_SunnyDay",
        "Weather_Fei_HeavyRain", "Weather_SpringFestival", "Weather_ZuShiBiHu",
        "Modifier_Weather_Magic_ZhenShuiJieJie",
        "Modifier_Weather_Magic_BeiDouJianJie",
        "Modifier_Weather_Magic_ZhenHuoJieJie", "MakeMapYaoShou",
        "Modifier_Yaoshou_Glv_Upgrade", "Modifier_Yaoshou_Glv1",
        "Modifier_Yaoshou_Glv2", "Modifier_Yaoshou_Glv3",
        "Modifier_Yaoshou_Glv4", "Modifier_Yaoshou_Glv5",
        "Modifier_Yaoshou_Glv6", "Modifier_Yaoshou_Glv7",
        "Modifier_Yaoshou_Glv8", "Modifier_Yaoshou_Glv9",
        "Modifier_Yaoshou_Glv10", "Modifier_Yaoshou_Glv11",
        "Modifier_Yaoshou_Glv12", "Modifier_Yaoshou_FixGlv1",
        "Modifier_Yaoshou_FixGlv2", "Modifier_Yaoshou_FixGlv3",
        "Modifier_Yaoshou_FixGlv4", "Modifier_Yaoshou_FixGlv5",
        "Modifier_Yaoshou_FixGlv6", "Modifier_Yaoshou_FixGlv7",
        "Modifier_Yaoshou_FixGlv8", "Modifier_Yaoshou_FixGlv9",
        "Modifier_Yaoshou_FixGlv10", "Modifier_Yaoshou_FixGlv11",
        "Modifier_Yaoshou_FixGlv12", "Zhen_XianTianMuLing", "Zhen_ZTLYQLSJ",
        "Zhen_ZhenEnginePower1", "Zhen_ZhenEnginePower2",
        "Zhen_ZhenEnginePower3", "Zhen_ZhenEnginePower4",
        "Zhen_FashuhejiEffect", "Zhen_LinkEffect", "Zhen_LinkEffectCore",
        "Zhen_RevealEffect", "Zhen_CancelZhenRecover", "Zhen_ChangeEffect",
        "BDPW_Lock"

    };
    QFWDlib.ModifierListDisplayName = {};
    QFWDlib.raceName = {
        "人族", "蛟龙", "凶凤", "烛龙", "妖兔", "妖狼", "妖蛇",
        "妖猪", "妖熊", "妖蛙", "妖龟", "龙之仆役(夜)",
        "龙之仆役(昼)", "恶念龙形", "善念龙形", "妖虎", "妖牛",
        "妖猫", "妖鸡", "兔子", "鸡", "狼", "蛇", "野猪", "熊",
        "龟", "青蛙", "蜚", "鹿蜀", "猫", "牛", "老虎",

        "化形兔妖", "化形鸡妖", "化形狼妖", "化形蛇妖",
        "化形猪妖", "化形熊妖", "化形龟妖", "化形蛙妖",
        "化形猫妖", "化形牛妖", "化形虎妖", "傀儡",
        "春节猪妖", "春节小妖", "春节鼠妖", "春节小妖2",
        "身体部件", "幼龙", "幼凤", "神犬花卷", "灵狐秦暮雪",
        "浮龙长海", "玄凤亦鸣", "春节烛龙"

    };
    QFWDlib.race = {
        "Human", "Boss_Long", "Boss_Feng", "Boss_Zhulong", "JYRabbit", "JYWolf",
        "JYSnake", "JYBoar", "JYBear", "JYFrog", "JYTurtle", "JYLongpuNight",
        "JYLongpuDay", "JYZhuLongENian", "JYZhuLongShanNian", "JYTiger",
        "JYCattle", "JYCat", "JYChicken", "Rabbit", "Chicken", "Wolf", "Snake",
        "Boar", "Bear", "Turtle", "Frog", "Fei", "Lushu", "Cat", "Cattle",
        "Tiger", "YGRabbit", "YGChicken", "YGWolf", "YGSnake", "YGBoar",
        "YGBear", "YGTurtle", "YGFrog", "YGCat", "YGCattle", "YGTiger",

        "Puppet", "NY_Zhuyao", "NY_Jingguai", "NY_Shuyao", "NY_Jingguai2",
        "BodyPart", "MiniLong", "MiniFeng", "LsDog", "LsFox", "LsDragon",
        "LsPhoenix", "SP_Zhulong"
    };

    QFWDlib.ThingsAttribute = {};
    QFWDlib.Things = {};
    QFWDlib.ThingsDisplayName = {};
    QFWDlib.ItemLable = {
        CS.XiaWorld.g_emItemLable.None, -- 61 RID: 3169
        CS.XiaWorld.g_emItemLable.Wood, -- 62 RID: 3170
        CS.XiaWorld.g_emItemLable.WoodBlock, -- 63 RID: 3171
        CS.XiaWorld.g_emItemLable.Rock, -- 64 RID: 3172
        CS.XiaWorld.g_emItemLable.RockBlock, -- 65 RID: 3173
        CS.XiaWorld.g_emItemLable.Metal, -- 66 RID: 3174
        CS.XiaWorld.g_emItemLable.Plant, -- 67 RID: 3175
        CS.XiaWorld.g_emItemLable.PlantProduct, -- 68 RID: 3176
        CS.XiaWorld.g_emItemLable.Ingredient, -- 69 RID: 3177
        CS.XiaWorld.g_emItemLable.Meat, -- 6A RID: 3178
        CS.XiaWorld.g_emItemLable.Leather, -- 6B RID: 3179
        CS.XiaWorld.g_emItemLable.Cloth, -- 6C RID: 3180
        CS.XiaWorld.g_emItemLable.Bone, -- 6D RID: 3181
        CS.XiaWorld.g_emItemLable.Weapon, -- 6E RID: 3182
        CS.XiaWorld.g_emItemLable.FightFabao, -- 6F RID: 3183
        CS.XiaWorld.g_emItemLable.TreasureFabao, -- 70 RID: 3184
        CS.XiaWorld.g_emItemLable.Hat, -- 71 RID: 3185
        CS.XiaWorld.g_emItemLable.Clothes, -- 72 RID: 3186
        CS.XiaWorld.g_emItemLable.Trousers, -- 73 RID: 3187
        CS.XiaWorld.g_emItemLable.Food, -- 74 RID: 3188
        CS.XiaWorld.g_emItemLable.Drug, -- 75 RID: 3189
        CS.XiaWorld.g_emItemLable.Dan, -- 76 RID: 3190
        CS.XiaWorld.g_emItemLable.Spell, -- 77 RID: 3191
        CS.XiaWorld.g_emItemLable.Tool, -- 78 RID: 3192
        CS.XiaWorld.g_emItemLable.MetalBlock, -- 79 RID: 3193
        CS.XiaWorld.g_emItemLable.Esoterica, -- 7A RID: 3194
        CS.XiaWorld.g_emItemLable.LeftoverMaterial, -- 7B RID: 3195
        CS.XiaWorld.g_emItemLable.SpellPaper, -- 7C RID: 3196
        CS.XiaWorld.g_emItemLable.LingStone, -- 7D RID: 3197
        CS.XiaWorld.g_emItemLable.Garbage, -- 7E RID: 3198
        CS.XiaWorld.g_emItemLable.SoulCrystal, -- 7F RID: 3199
        CS.XiaWorld.g_emItemLable.Treasure, -- 80 RID: 3200
        CS.XiaWorld.g_emItemLable.Influence, -- 81 RID: 3201
        CS.XiaWorld.g_emItemLable.SPStuffCategories, -- 82 RID: 3202
        CS.XiaWorld.g_emItemLable.Other
    }

    QFWDlib.GlobleSchools = {};

    QFWDlib.GlobleSchoolBaseAttributeName2 = {};
    QFWDlib.GlobleSchoolBaseAttribute = {};
    QFWDlib.SchoolLevel = {
        CS.XiaWorld.g_emSchoolLevel.None, CS.XiaWorld.g_emSchoolLevel.Zhai,
        CS.XiaWorld.g_emSchoolLevel.Pai, CS.XiaWorld.g_emSchoolLevel.Dong
    };
    QFWDlib.SchoolRank = {
        CS.XiaWorld.g_emPrestigeRank.None, CS.XiaWorld.g_emPrestigeRank.Rank13,
        CS.XiaWorld.g_emPrestigeRank.Rank12,
        CS.XiaWorld.g_emPrestigeRank.Rank11, CS.XiaWorld.g_emPrestigeRank.Rank0,
        CS.XiaWorld.g_emPrestigeRank.Rank01,
        CS.XiaWorld.g_emPrestigeRank.Rank21,
        CS.XiaWorld.g_emPrestigeRank.Rank22, CS.XiaWorld.g_emPrestigeRank.Rank23
    };

    QFWDlib.ThingTypes = {
        CS.XiaWorld.g_emThingType.None, CS.XiaWorld.g_emThingType.Npc,
        CS.XiaWorld.g_emThingType.Item, CS.XiaWorld.g_emThingType.Plant,
        CS.XiaWorld.g_emThingType.Building, CS.XiaWorld.g_emThingType.Space,
        CS.XiaWorld.g_emThingType.CMD
    };
    QFWDlib.AllThingTerrainsTrueDisplayName = {};
    QFWDlib.AllThingTerrainsTrue = {};
    QFWDlib.AllTerrains = {
        "TerrainBase", "Null", "Sand", "Soil", "Mud", "WetLand", "FertileSoil",
        "StoneLand", "SandLand", "LingSoil", "DepthDepthWater", "DepthWater",
        "ShallowWater", "BloodWater", "LingWater", "FloorBase", "WoodFloor1",
        "WoodFloor2", "Carpet1", "Floor1", "Floor2", "Floor3", "Floor4",
        "Floor5", "Floor6", "Floor7", "Floor8", "Floor9", "Floor10", "Floor11",
        "Floor12", "Floor13", "Floor14", "Floor15", "Floor16", "Floor17",
        "Floor18", "Floor19", "Floor20", "Floor21", "Floor22", "Floor23",
        "Floor24", "Floor25", "Floor26", "Floor27", "Floor28", "Floor29"

    };
    QFWDlib.AllThingBuildsTrueDisplayName = {};
    QFWDlib.AllThingBuildsTrue = {};
    QFWDlib.AllThingBuilds = {
        "FloorBase", "Carpet1", "Floor1", "Floor2", "Floor3", "Floor4",
        "Floor5", "Floor6", "Floor7", "Floor8", "Floor9", "Floor10", "Floor11",
        "Floor12", "Floor13", "Floor14", "Floor15", "Floor16", "Floor17",
        "Floor18", "Floor19", "Floor20", "Floor21", "Floor22", "Floor23",
        "Floor24", "Floor25", "Floor26", "Floor27", "Floor28", "Floor29",
        "FurnitureBase", "Bed", "Bed2", "DoubleBed", "DoubleBed2", "SmallTable",
        "Table", "WaterTank", "SmallPool", "StreetLight", "StreetLight1",
        "StreetLight2", "Lantern", "Lantern1", "Lantern2", "Lantern3",
        "Lantern4", "Lantern5", "Lantern6", "Lantern_S1", "Candlestick",
        "TicTacToe", "GoTable", "GuzhengTable", "CalligraphyTable", "CageShelf",
        "Building_Tomb", "Building_BigTomb", "FengShui", "TheGate",
        "Build_TheBigGate", "Cushion", "Building_MagicCushion",
        "BasePracticePlace", "PuppetPlace", "TrainingDummy", "ExploreBackPlace",
        "Building_Statue1", "Building_Statue2", "Building_Statue3",
        "Building_SacrificialTable", "DanStove", "DanStove_Part",
        "RefiningCushion", "Building_SleeveSpace", "Building_SleeveSpace1",
        "OrnamentBase", "Building_StoneMan", "Building_Flag1", "Building_Flag2",
        "Building_Flag3", "Building_StoneLion", "Building_StoneLion2",
        "Building_StoneLion3", "Building_BigTripod", "Building_SmallTripod",
        "Building_BigCenser", "Building_SmallCenser", "Building_BigSwordPillar",
        "Building_BigVase", "Building_SmallVase", "Building_Screen1",
        "Building_BookShelf", "Building_ItemShelf", "Building_ShuZhuangTai",
        "Building_Tower", "Building_Tower2", "Building_ShiBei",
        "Building_Zhong", "Building_Gu", "Building_JiaShan1",
        "Building_JiaShan2", "Building_PenZai1", "Building_PenZai2",
        "Building_PenZai3", "Building_Tower1", "Building_ShiBei1",
        "Building_Zhong1", "Building_Gu1", "Building_BookShelf_CangJing",
        "Building_ZhengFaPlantBase", "Building_ZhengFaBuildBase", "MiracleBase",
        "Building_BaBaoGongDe", "Building_BaBaoGongDe_Our",
        "Building_WanDaoZunFaZuo", "Building_WanDaoZunFaZuo_Our",
        "Building_QiQingQingTongShu", "Building_QiQingQingTongShu_Our",
        "Building_ZhouTianXingDouPan", "Building_ZhouTianXingDouPan_Our",
        "Building_WuLongXuanJinTa", "Building_WuLongXuanJinTa_Our",
        "Building_ShuShanJianChi", "Building_ShuShanJianChi_Our",
        "Building_LingYuFeng", "Building_LingYuFeng_Our",
        "Building_WanGuXieFaTan", "Building_WanGuXieFaTan_Our",
        "Building_XuanCiTianKeng", "Building_XuanCiTianKeng_Our",
        "Building_QiShaShenBei", "Building_QiShaShenBei_Our",
        "Building_XuanYinShengQuan", "Building_XuanYinShengQuan_Our",
        "Building_QiShi1", "Building_ShuiZhongQiShi1", "Building_QiShi2",
        "Building_ShuiZhongQiShi2", "Building_QiShi3",
        "Building_ShuiZhongQiShi3", "Building_QiShi4",
        "Building_ShuiZhongQiShi4", "Building_QiShi5",
        "Building_ShuiZhongQiShi5", "Building_QiShi6",
        "Building_ShuiZhongQiShi6", "Building_LingShu1", "Building_LingShu2",
        "Building_LingShu3", "Building_LingShu4", "Building_LingShu5",
        "Building_LingShu6", "Building_ZiXiaoJuShu", "Building_ShaShenMu1",
        "Building_ShaShenMu2", "Building_ShaShenMu3", "Building_ShaShenMu4",
        "Building_ShuiShenHuaShu1", "Building_ShuiShenHuaShu2",
        "Building_ShuiShenHuaShu3", "Building_TaoShu1", "Building_TaoShu2",
        "Building_TaoShu3", "Building_YuShu1", "Building_YuShu2",
        "Building_YuShu3", "Building_YuShu4", "Building_YuShu5",
        "Building_YuShu6", "Building_LingDiShuiChi", "Building_LianFaTan",
        "Building_TaiXuanBingZhu", "Build_KunLunFang", "Building_QingTongLong",
        "Building_QingTongShouXiangLu", "Building_QingTongFanQi",
        "Building_YanDiTai", "Building_JuXingXiangLu", "Building_TengLongZhu",
        "Building_HuangLongDengTai", "Building_LianHuaDengTai",
        "Building_YuHeQingLian1", "Building_YuHeQingLian2",
        "Building_YuHeQingLian3", "Building_JianYiFuDiao",
        "Building_XiaoDanLu1", "Building_XiaoDanLu2", "Building_HuoDing",
        "Building_ShuiLianTai", "Building_XieXiDeng", "Building_KuLouDeng",
        "Build_BaiManFang", "Building_DiMuJiDeng", "Building_DiMuJiQi",
        "Building_DiMuMiXue", "Building_QiShaJianZhu",
        "Building_XieLongDiaoXiang", "Building_XiongKuiDeng",
        "Building_ShaZhang1", "Building_ShaZhang2", "Building_QingShaDeng",
        "Building_BingFengDiaoSu", "Building_DiMuKuiShou", "Building_MoMenJiQi",
        "Building_MoMenJiQi1", "Building_MoZhuaDiaoSu", "Building_MoWenHuaPing",
        "Building_KuLouHuaPing", "Building_XiePingFeng",
        "Building_Jiaolong_Hanyu", "Building_Jiaolong_Body",
        "Building_Dragon_Hole", "Building_Xiongfeng_dan",
        "Building_Xiongfeng_dan_test", "Building_Xiongfeng_danbroken",
        "Building_Zhulong_yingdan", "Building_Zhulong_yangdan",
        "Building_Zhulong_yingdan_broken", "Building_Zhulong_yangdan_broken",
        "ProductionBase", "WorkPlace", "MaterialWorkPlace", "Bonfire",
        "Kitchen", "StoneMaker", "WeaponMaker", "Furnace", "TextileTable",
        "TailorTable", "WoodShed", "MillStone", "HandWorkTable", "Well",
        "MedicineTable", "Building_YiTui", "Building_YiTui1", "RoofBase",
        "GrassRoof", "CaveRoof", "WoodRoof", "StoneRoof",
        "WoodRoof_SpringFestival", "StoneRoof_SpringFestival",
        "SYS_LOASBUILDING", "Sys_HideBuilding", "FillBase", "FillSoil",
        "FillFertileSoil", "FillShallowWater", "NPCBornPoint_SchoolCore",
        "NPCBornPoint_Ordinary", "NPCBornPoint_Random", "NPCBornPoint_Fill",
        "NPCBornPoint_JYMonster", "NPCBornPoint_Animal", "BDSetPoint_Gong",
        "BDSetPoint_Outs", "FillBuild_Hide", "FillBuild_Empty",
        "HideBuild_Empty", "BuildingRuins", "Building_SwordTower",
        "Building_HenZhiBei", "Building_LongZhiBei", "Building_ShouZhiBei",
        "Building_JiZhiBei", "Building_HuanZhiBei", "Building_ZhongBei",
        "Building_LingBei", "Building_XingBei", "Building_MuBei",
        "Building_TaiYiMen", "StreetNoLight", "FireLantern", "GolemLantern",
        "OddLantern", "Building_TaiYiTower", "WallBase", "DoorBase", "Wall",
        "Barrier2", "Barrier", "Door", "Door_SpringFestival", "Door_Fight",
        "Door_SpringFestival_Fight", "Firecracker", "HideDoor"

    };

    QFWDlib.AllThingPlantsTrueDisplayName = {};
    QFWDlib.AllThingPlantsTrue = {};
    QFWDlib.AllThingPlants = {
        "Dandelion", "Flower1", "IceFlower1", "Flower2", "Flower3", "Flower4",
        "Flower5", "BoxBase", "Box_Cargo", "Box_Corpse", "Box_Corpse_OldMan1",
        "Box_Corpse_OldMan2", "Box_Corpse_BeastMan", "Box_Corpse_ShiXiong",
        "FarmBase", "Wheat", "Healroot", "Cotton", "Mushroom", "LingZhiBase",
        "LingZhi_Huo", "LingZhi_Jin", "LingZhi_Mu", "LingZhi_Shui",
        "LingZhi_Tu", "LingZhi_Huo_ZF", "LingZhi_Jin_ZF", "LingZhi_Mu_ZF",
        "LingZhi_Shui_ZF", "LingZhi_Tu_ZF", "Ginseng", "GanodermaLucidum",
        "Mint", "MagicHerb", "WarmHerb", "TreeBase", "TreePoplar", "TreePine",
        "TreePine_Big", "TreePear", "TreeGinkgo", "TreeGinkgo_Big",
        "TreeGinkgo_Dead", "PintuBase", "TreePeach", "TreeJade", "TreeBone",
        "Grass", "IceGrass", "Reed", "LongGrass", "Raspberry", "Lotus",
        "LittleRock", "IceLittleRock", "IronOre", "CopperOre", "SilverOre",
        "RockBrown", "RockGray", "RockMarble", "RockJade", "RockCinnabar",
        "RockBase", "MetalBase", "Darksteel", "LingStone"
    };

    QFWDlib.AllThingItemsTrueDisplayName = {};
    QFWDlib.AllThingItemsTrue = {};
    QFWDlib.AllThingItems = {
        "Item_Boss_Jiaowangci", "Item_Boss_Fenghuangneidan",
        "Item_Boss_Fenghuanghuoyu", "BossDropItemBase", "Item_BossFeng_HuoYu",
        "Item_BossFeng_GangYu", "Item_BossFeng_TouYu", "Item_BossFeng_WeiYu",
        "Item_BossFeng_Gu", "Item_BossFeng_HongYu", "Item_BossFeng_Meat",
        "Item_DragonScale", "Item_BossLong_Jiao", "Item_BossLong_Zhua",
        "Item_BossLong_Lin", "Item_BossLong_NiLin", "Item_BossLong_Jing",
        "Item_BossLong_Meat", "Item_BossZhuLong_BaiLin",
        "Item_BossZhuLong_HeiLin", "Item_BossZhuLong_Eye",
        "Item_BossZhuLong_TianLin", "Item_BossZhuLong_LongYu",
        "Item_BossZhuLong_Meat", "Item_BossFeng_FengYin",
        "Item_BossZhuLong_FengYin", "DanBase", "Item_BasePracticeDrug",
        "Item_Dan_JingYuan", "Item_Dan_JingYuan2", "Item_Dan_JingYuan3",
        "Item_Dan_Ling", "Item_Dan_Ling2", "Item_Dan_PracticeRate",
        "Item_Dan_PracticeSpeed", "Item_Dan_CalmDown", "Item_Dan_Happiness",
        "Item_Dan_NoHunger", "Item_Dan_NoHunger2", "Item_Dan_NoHunger1",
        "Item_Dan_LostSoul", "Item_Dan_DredgeQi1", "Item_Dan_DredgeQi",
        "Item_Dan_WuLingSan", "Item_Dan_CureJinDamage", "Item_Dan_CureMuDamage",
        "Item_Dan_CureShuiDamage", "Item_Dan_CureHuoDamage",
        "Item_Dan_CureTuDamage", "Item_Dan_CureFiveElementDamage",
        "Item_Dan_Restore", "Item_Dan_Insect", "Item_Dan_ExtremeLofty",
        "Item_Dan_HundredRefine", "Item_Dan_IncreaseLife1",
        "Item_Dan_IncreaseLife2", "Item_Dan_IncreaseLife3",
        "Item_Dan_IncreaseLife4", "Item_Dan_IncreaseLife5",
        "Item_Dan_IncreaseNeckCountdown1", "Item_Dan_IncreaseNeckCountdown2",
        "Item_Dan_SwordBall", "Item_Dan_Defense", "Item_Dan_Ling3",
        "Item_Dan_FiveBase1", "Item_Dan_FiveBase2", "Item_Dan_FiveBase3",
        "Item_Dan_FiveBase4", "Item_Dan_FiveBase5", "Item_Dan_FiveBaseFromLife",
        "Item_Dan_Fail1", "Item_Dan_Fail2", "Item_Dan_Fail3", "Item_Dan_Fail4",
        "Item_Dan_Fail5", "Item_Dan_TreeEXP", "Item_Dan_Thin", "Item_Dan_Fat",
        "Item_Dan_FaceLock", "Item_Dan_FaceUnLock", "Item_Dan_Fat",
        "Item_Dan_Soul1", "Item_Dan_Soul2", "Item_Dan_Soul3", "Item_Dan_Soul4",
        "Item_Dan_LunHui1", "Item_Dan_ReBorn", "Item_Dan_ReBorn_4",
        "Item_Dan_LingYuanZhong", "Item_Dan_LingYuanSha", "Item_Dan_LongDan1",
        "Item_Dan_FengDan1", "Item_Dan_ZhuLongDan1", "Item_Dan_FenShen1",
        "Item_Dan_FenShen2", "Item_Dan_FenShen3", "Item_Dan_TiShen", "DrugBase",
        "Item_Fruit", "Item_LingWater", "Item_ZaoHuaYuLu", "Item_SilverGrit",
        "Item_CopperGrit", "Item_Cinnabar", "Item_JinEssence", "Item_MuEssence",
        "Item_ShuiEssence", "Item_HuoEssence", "Item_TuEssence",
        "Item_LingMuXueJie", "Item_EarthEssence", "Item_EarthEssence1",
        "Item_EarthEssence_1", "Item_EarthEssence1_1", "Item_LifeStream",
        "Item_Ginseng", "Item_GanodermaLucidum", "Item_RedGinseng",
        "Item_PurpleGanodermaLucidum", "Item_SoulPearl", "Item_MonsterBlood",
        "Item_Mint", "Item_MagicHerb", "Item_Ginkgo", "Item_SnakeGallbladder",
        "Item_BearGallbladder", "Item_Healroot", "Item_Hemostatics",
        "Item_SmallCycle", "Item_Plaster", "Item_StoneEssenceDrug",
        "Item_Anodyne", "Item_Laxative", "Item_ThunderAir", "Item_XianBone",
        "Item_XianBoneBall", "Item_ZaoHuaYuZi", "Item_BenYuan_None",
        "Item_BenYuan_Jin", "Item_BenYuan_Mu", "Item_BenYuan_Shui",
        "Item_BenYuan_Huo", "Item_BenYuan_Tu", "Item_YuanHunLu",
        "Item_XieHunLu", "Item_YanDaoGuo", "Item_QieDaoGuo",
        "Item_XianDaoShenNian", "Item_XianDaoXieNian", "Item_WinterWarm",
        "Item_SummerHerb", "Item_God_ZhiNianJieJing", "SimpleFoodBase",
        "Item_Cake", "Item_Jerky", "Item_PreservedFruit", "Item_Yao_BoarMeat",
        "Item_SoulCrystalBase", "Item_SoulCrystalYou", "Item_SoulCrystalNing",
        "Item_SoulCrystalLing", "SpellBase", "Item_SpellPaper",
        "Item_SpellPaperLv2", "Item_SpellPaperLv3", "Item_Spell",
        "Item_SpellLv2", "Item_SpellLv3", "ToolBase", "Item_Dice",
        "Item_SmallBell", "Item_Bracelet", "Item_Handkerchief",
        "Item_PerfumeBag", "Item_WhiteHair", "Item_LunHui_PerfectWorld",
        "Item_LunHui_QiYuanZhiXin", "Item_LunHui_DongFangHeShenZhen",
        "Item_MuBai_BaiYuShi", "Item_QingLianShan_SiXiang",
        "Item_Other_PuppetTest", "Item_Yao_RabbitLuck", "Item_Yao_WolfAtk",
        "Item_Yao_SnakeHanLin", "Item_Yao_BearPiMao", "Item_Yao_TurtleKe",
        "Item_StoneCutter", "Item_SewingDefender", "Item_MillVell",
        "Item_Sys_RanSeYu", "ClothesBase", "Item_SummerClothes",
        "Item_SilkClothes", "Item_PracticeClothes", "Item_FormalClothes",
        "Item_WinterClothes", "Item_SP_Clothes1", "Item_SP_Clothes2",
        "Item_SP_Clothes3", "Item_SP_Clothes4", "Item_SP_Clothes5",
        "Item_SP_Clothes6", "Item_SP_Clothes7", "Item_SP_Clothes8",
        "Item_SP_Clothes9", "Item_SP_Clothes10", "FaBaoBase", "FaBaoTest",
        "FightFaBao", "FlyFaBao", "TreasureFabao", "JieCloud", "HatBase",
        "Item_WoodHat", "Item_Hat", "MiBaoBase", "Item_MiBao_WuDuZhuXianSword",
        "Item_MiBao_BaiLingZhanXianSword", "Item_MiBao_ShiErShaShenMoLingSha",
        "Item_MiBao_TianMoHuaXueShenDao", "Item_MiBao_YinHunZhu",
        "Item_MiBao_JiuTianYuanYangChi", "Item_MiBao_LongXinYinYangGui",
        "Item_MiBao_DaiShenZhu", "Item_MiBao_QiJueShenZhen",
        "Item_MiBao_XiXingShenSuo", "Item_MiBao_TaiYiFenGuangJian",
        "Item_MiBao_WuqiLeiFu", "Item_MiBao_JinFabao", "Item_MiBao_MuFabao",
        "Item_MiBao_ShuiFabao", "Item_MiBao_HuoFabao", "Item_MiBao_TuFabao",
        "Item_MiBao_JinLianShenZuo", "Item_MiBao_TunLingShenJian",
        "Item_MiBao_ShenNongDing", "Item_MiBao_QingNingFeiYu",
        "Item_MiBao_YuanShenXinJian", "Item_MiBao_ZhuXianJian",
        "Item_MiBao_LuXianJian", "Item_MiBao_XianXianJian",
        "Item_MiBao_JueXianJian", "Item_MiBao_TianLangDing",
        "Item_MiBao_TianShu", "Item_MiBao_TianQuan", "Item_MiBao_TianJi",
        "Item_MiBao_TianXuan", "Item_MiBao_YuHeng", "Item_MiBao_KaiYang",
        "Item_MiBao_YaoGuang", "Item_MiBao_KuiHuaShenJian",
        "Item_MiBao_ZhuXianZhenTu", "Item_MiBao_QiXingZhenTu",
        "Item_MiBao_TianDiWuFangZhenTu", "Item_MiBao_LiuYuZhenTu",
        "Item_MiBao_LongXingZhenTu", "Item_MiBao_FengHunZhenTu",
        "Item_MiBao_YinYangZhenTu", "Item_MiBao_SanYinZhenTu",
        "Item_MiBao_BaMenZhenTu", "Item_MiBao_ShenMuZhenTu",
        "Item_MiBao_WuYueZhenTu", "Item_Wonder_BaBaoGongDe",
        "Item_Wonder_WanDaoZunFaZuo", "Item_Wonder_QiQingQingTongShu",
        "Item_Wonder_ZhouTianXingDouPan", "Item_Wonder_WuLongXuanJinTa",
        "Item_Wonder_ShuShanJianChi", "Item_Wonder_LingYuFeng",
        "Item_Wonder_WanGuXieFaTan", "Item_Wonder_XuanCiTianKeng",
        "Item_Wonder_XuanCiTianKeng", "Item_Wonder_QiShaShenBei",
        "Item_Wonder_XuanYinShengQuan", "Item_Wonder_QianKunLingJing",
        "TrousersBase", "Item_SummerTrousers", "Item_SilkTrousers",
        "Item_PracticeTrousers", "Item_FormalTrousers", "Item_WinterTrousers",
        "Item_SP_Trousers1", "Item_SP_Trousers2", "Item_SP_Trousers3",
        "Item_SP_Trousers4", "Item_SP_Trousers5", "Item_SP_Trousers6",
        "Item_SP_Trousers7", "Item_SP_Trousers8", "Item_SP_Trousers9",
        "Item_SP_Trousers10", "WeaponBase", "Item_TestKnife", "Item_WeaponBow",
        "Item_WeaponWoodBow", "Item_WeaponKnife", "Item_WeaponLance",
        "Item_WeaponSword", "Item_WeaponHalbert", "Item_WeaponAxeRing",
        "FengShuiItemBase", "FengShuiItem_YinZhang1", "FengShuiItem_YinZhang2",
        "FengShuiItem_YinZhang3", "FengShuiItem_Ta1", "FengShuiItem_Ta2",
        "FengShuiItem_Ping1", "FengShuiItem_Ding1", "FengShuiItem_Bei1",
        "FengShuiItem_ShiZi1", "FengShuiItem_ShiTou1", "FengShuiItem_TuHua1",
        "FengShuiItem_ShuJi1", "FengShuiItem_QiJu1", "FengShuiItem_FuZhou1",
        "FengShuiItem_Jian1", "FengShuiItem_HuLu1", "FengShuiItem_BaoBei1",
        "FengShuiItem_SheLi1", "IngredientBase", "Item_Flour", "Item_Pear",
        "Item_Wheat", "Item_Mushroom", "Item_Lotusroot", "LeftoverMaterialBase",
        "Item_WoodLeftover", "Item_HardWoodLeftover",
        "Item_ParasolWoodLeftover", "Item_LingWoodLeftover",
        "Item_BrownRockLeftover", "Item_GrayRockLeftover",
        "Item_MarbleLeftover", "Item_JadeLeftover", "Item_SkyStoneLeftover",
        "Item_LingStoneLeftover", "Item_LingCrystalLeftover",
        "Item_IronRockLeftover", "Item_CopperRockLeftover",
        "Item_SilverRockLeftover", "Item_DarksteelRockLeftover",
        "Item_StarEssenceLeftover", "MeatBase", "Item_BoarMeat",
        "Item_FrogMeat", "Item_TurtleMeat", "Item_BearMeat", "Item_Beef",
        "Item_RabbitMeat", "Item_ChickenMeat", "Item_WolfMeat", "Item_FishMeat",
        "Item_SnakeMeat", "Item_ChickenEgg", "Item_SnakeEgg", "Item_TurtleEgg",
        "Item_LongEgg", "Item_FengEgg", "MetalBlockBase", "Item_IronBlock",
        "Item_CopperBlock", "Item_SilverBlock", "Item_CopperBlock1",
        "Item_SilverBlock1", "Item_DarksteelBlock", "Item_StarEssenceBlock",
        "RockBlockBase", "Item_BrownRockBlock", "Item_GrayRockBlock",
        "Item_MarbleBlock", "Item_JadeBlock", "Item_SkyStoneBlock",
        "Item_LingStoneBlock", "Item_LingCrystalBlock", "WoodBlockBase",
        "Item_RoughWoodBlock", "Item_HardWoodBlock", "Item_ParasolWoodBlock",
        "Item_LingWoodBlock", "ClothBase", "Item_CottonCloth",
        "Item_DeepBlueCloth", "Item_PurpleCloth", "Item_YellowCloth",
        "Item_BlueCloth", "Item_RedCloth", "Item_WhiteCloth", "Item_BlackCloth",
        "LeatherBase", "Item_BoarLeather", "Item_RabbitLeather",
        "Item_BearLeather", "Item_WolfLeather", "Item_FeiLeather",
        "Item_LuShuLeather", "Item_YaoLeather", "Item_YaoLeather1", "MetalBase",
        "Item_IronRock", "Item_CopperRock", "Item_SilverRock",
        "Item_DarksteelRock", "Item_StarEssence", "Item_Other_BingCanSi",
        "Item_Other_BuZhiMing", "Item_Other_JinJing", "Item_Other_MuJing",
        "Item_Other_ShuiJing", "Item_Other_HuoJing", "Item_Other_TuJing",
        "Item_Other_NoneJing", "Item_Other_NoneJing", "Item_Other_LarkPerk",
        "Item_Other_BuffaloHorn", "Item_Other_LionFang",
        "Item_Other_TortoiseShell", "Item_Other_DeerFeet",
        "Item_SPStuffCategories_1", "Item_Other_Portia_1",
        "Item_Other_Portia_2", "Item_Other_Portia_3", "Item_Other_Portia_4",
        "Item_Other_Portia_5", "Item_Other_Portia_6", "Item_Other_Portia_7",
        "Item_Other_Portia_8", "Item_Other_Portia_9", "Item_Other_Portia_10",
        "Item_Other_Portia_11", "Item_Other_Portia_12", "Item_Other_Portia_13",
        "Item_Other_Portia_14", "Item_Other_Portia_15", "Item_Other_Portia_16",
        "Item_Other_Portia_17", "Item_Other_Portia_18", "Item_Other_Portia_19",
        "Item_Other_Portia_20", "Item_Other_Portia_21", "Item_Other_Portia_22",
        "Item_Other_Portia_23", "Item_Other_Portia_24", "Item_Other_Portia_25",
        "Item_Other_Portia_26", "Item_Other_Portia_27", "Item_Other_Portia_28",
        "Item_Other_Portia_29", "Item_Other_Portia_30", "Item_Other_Portia_31",
        "Item_Other_Portia_32", "Item_Other_Portia_33", "Item_Other_Portia_34",
        "Item_Other_Portia_35", "Item_Other_Portia_36", "Item_Grass",
        "Item_Cotton", "RockBase", "Item_BrownRock", "Item_GrayRock",
        "Item_Marble", "Item_Jade", "Item_JadeEssence", "Item_StoneEssence",
        "Item_SkyStone", "Item_ExtremeJade", "Item_LingStone",
        "Item_LingCrystal", "WoodBase", "Item_Wood", "Item_HardWood",
        "Item_ParasolWood", "Item_LingWood", "SYS_LOASITEM",
        "Item_HorribleMeal", "Item_HomeFood", "Item_DeliciousFood",
        "Item_DelicacyFood", "Item_GuanyinMud", "Item_Water", "Item_DirtyWater",
        "Item_Garbage", "Item_Shit", "Item_DragonShit", "Item_FunPainting",
        "Item_FunPoem", "Item_FunMusic", "Item_FunChess", "Item_SysAxe",
        "Item_SysPickaxe", "Item_SysSickle", "Item_SysAcupuncture",
        "Item_Umbrella", "Item_Esoterica", "Item_StoneBox", "Item_StoneBox1",
        "Item_E_FaBaoBox", "Item_E_DanBox", "Item_E_MiJiBox", "Item_E_FuBox",
        "Item_StoneBox2", "Item_BuildingBox", "Item_Baobeier",
        "Item_LunHui_Box1", "Item_LunHui_Box2", "Item_ZuShiZhiCi",
        "Item_SuoYingZhiJuan", "Item_XiangHuo1", "Item_XiangHuo2",
        "Item_XiangHuo3", "Item_XiangHuo4", "Item_XiangHuo5", "Item_XiangHuo6",
        "Item_OldSchool_Letter", "Item_StrangeMush", "Item_AuctionPaper",
        "Item_GodPractice_MiJuan", "Item_GodPractice_MiJuan_1",
        "Item_GodPractice_MiJuan_2", "Item_GodPractice_MiJuan_3",
        "Item_GodPractice_MiJuan_4", "Item_GodPractice_MiJuan_6",
        "Item_GodPractice_MiJuan_5", "Item_Gong12", "Item_God_GongAll",
        "Item_God_Guard1", "Item_God_Guard2", "Item_God_Guard3",
        "Item_Sys_Gong", "Item_Firecracker", "Item_FirecrackerShit",
        "Item_Jiaozi", "Item_Yingbi1", "Item_Yingbi2", "Item_Yingbi3",
        "Item_SpringBox", "Item_ShangGuYiWenLu1", "Item_ShangGuYiWenLu5",
        "Item_ShangGuYiWenLu7", "Item_ShangGuYiWenLu15", "Item_TaiYiMiDian",
        "Item_JinXiaCanJuan", "NormalAttackBase", "Human_NormalAttack",
        "Zombie_NormalAttack", "Rabbit_NormalAttack", "Chicken_NormalAttack",
        "Wolf_NormalAttack", "Snake_NormalAttack", "Boar_NormalAttack",
        "Bear_NormalAttack", "Turtle_NormalAttack", "Frog_NormalAttack",
        "LuShu_NormalAttack", "Fei_NormalAttack", "JYRabbit_NormalAttack",
        "JYWolf_NormalAttack", "JYSnake_NormalAttack", "JYBoar_NormalAttack",
        "JYBear_NormalAttack", "JYFrog_NormalAttack", "JYTurtle_NormalAttack",
        "JYLongPu_Night_NormalAttack", "JYLongPu_Day_NormalAttack"
    };
    QFWDlib.ThingItemGong = {"Gong_DaNeng", "Gong_YaoShou"};
    QFWDlib.ThingItemGongTrue = {};
    QFWDlib.ThingItemGongTrueDisplayName = {};
    QFWDlib.ThingItemGongType = {
        "None", "Jin", "Mu", "Shui", "Huo", "Tu", "Chaos"
    };
    QFWDlib.ThingItemEsotericaTrueDisplayName = {};
    QFWDlib.ThingItemEsotericaTrue = {};
    QFWDlib.ThingItemEsoterica = {};

    QFWDlib.JobList = {
        -- Token: 0x04000B3A RID: 2874
        None, -- Token: 0x04000B3B RID: 2875
        OutFire, -- Token: 0x04000B3C RID: 2876
        Treat, -- Token: 0x04000B3D RID: 2877
        Care, -- Token: 0x04000B3E RID: 2878
        Rest, -- Token: 0x04000B3F RID: 2879
        Xiulian, -- Token: 0x04000B40 RID: 2880
        Cooking, -- Token: 0x04000B41 RID: 2881
        Hunting, -- Token: 0x04000B42 RID: 2882
        Build, -- Token: 0x04000B43 RID: 2883
        Plant, -- Token: 0x04000B44 RID: 2884
        Mine, -- Token: 0x04000B45 RID: 2885
        Cutoff, -- Token: 0x04000B46 RID: 2886
        Smithing, -- Token: 0x04000B47 RID: 2887
        Sew, -- Token: 0x04000B48 RID: 2888
        Handwork, -- Token: 0x04000B49 RID: 2889
        Carry, -- Token: 0x04000B4A RID: 2890
        Clean, -- Token: 0x04000B4B RID: 2891
        Count
    };
    QFWDlib.SkillList = {
        -- Token: 0x04000BFE RID: 3070
        CS.XiaWorld.g_emNpcSkillType.None, -- Token: 0x04000BFF RID: 3071
        CS.XiaWorld.g_emNpcSkillType.Fight, -- Token: 0x04000C00 RID: 3072
        CS.XiaWorld.g_emNpcSkillType.Qi, -- Token: 0x04000C01 RID: 3073
        CS.XiaWorld.g_emNpcSkillType.SocialContact,
        -- Token: 0x04000C02 RID: 3074
        CS.XiaWorld.g_emNpcSkillType.Medicine, -- Token: 0x04000C03 RID: 3075
        CS.XiaWorld.g_emNpcSkillType.Cooking, -- Token: 0x04000C04 RID: 3076
        CS.XiaWorld.g_emNpcSkillType.Building, -- Token: 0x04000C05 RID: 3077
        CS.XiaWorld.g_emNpcSkillType.Farming, -- Token: 0x04000C06 RID: 3078
        CS.XiaWorld.g_emNpcSkillType.Mining, -- Token: 0x04000C07 RID: 3079
        CS.XiaWorld.g_emNpcSkillType.Art, -- Token: 0x04000C08 RID: 3080
        CS.XiaWorld.g_emNpcSkillType.Manual, -- Token: 0x04000C09 RID: 3081
        CS.XiaWorld.g_emNpcSkillType.DouFa, -- Token: 0x04000C0A RID: 3082
        CS.XiaWorld.g_emNpcSkillType.DanQi, -- Token: 0x04000C0B RID: 3083
        CS.XiaWorld.g_emNpcSkillType.Fabao, -- Token: 0x04000C0C RID: 3084
        CS.XiaWorld.g_emNpcSkillType.FightSkill, -- Token: 0x04000C0D RID: 3085
        CS.XiaWorld.g_emNpcSkillType.Barrier, -- Token: 0x04000C0E RID: 3086
        CS.XiaWorld.g_emNpcSkillType.Zhen, -- Token: 0x04000C0F RID: 3087
        CS.XiaWorld.g_emNpcSkillType._Count
    }
    QFWDlib.BasePropertyType = {
        CS.XiaWorld.g_emNpcBasePropertyType.Perception,
        -- Token: 0x04000BE2 RID: 3042
        CS.XiaWorld.g_emNpcBasePropertyType.Physique,
        -- Token: 0x04000BE3 RID: 3043
        CS.XiaWorld.g_emNpcBasePropertyType.Charisma,
        -- Token: 0x04000BE4 RID: 3044
        CS.XiaWorld.g_emNpcBasePropertyType.Intelligence,
        -- Token: 0x04000BE5 RID: 3045
        CS.XiaWorld.g_emNpcBasePropertyType.Luck,
        -- Token: 0x04000BE6 RID: 3046
        -- Token: 0x04000BE7 RID: 3047
        CS.XiaWorld.g_emNpcBasePropertyType.Pain,
        -- Token: 0x04000BE8 RID: 3048
        CS.XiaWorld.g_emNpcBasePropertyType.Consciousness,
        -- Token: 0x04000BE9 RID: 3049
        CS.XiaWorld.g_emNpcBasePropertyType.Meridian,
        -- Token: 0x04000BEA RID: 3050
        CS.XiaWorld.g_emNpcBasePropertyType.Movement,
        -- Token: 0x04000BEB RID: 3051
        CS.XiaWorld.g_emNpcBasePropertyType.Operation,
        -- Token: 0x04000BEC RID: 3052
        CS.XiaWorld.g_emNpcBasePropertyType.Feeling,
        -- Token: 0x04000BED RID: 3053
        CS.XiaWorld.g_emNpcBasePropertyType.Count
    };
    QFWDlib.JianghuNPCAttributeName = {
        "名:", "姓:", "称号:", "称号(副):", -- "秘籍名:",
        "门派ID:",

        --		"喜欢物品1:","喜欢物品2:","喜欢物品3:","喜欢物品4:",
        --		"喜欢物品5:","喜欢物品6:","喜欢物品7:","喜欢物品8:",

        --		"讨厌物品1:","讨厌物品2:","讨厌物品3:","讨厌物品4:",
        --		"讨厌物品5:","讨厌物品6:","讨厌物品7:","讨厌物品8:",

        "性别:(1.None 2.Male 3.Female)", "功法等级:(1-6)", "性格:"
    };
    QFWDlib.JianghuDNNPCAttributeName = {"名:", "ID:", "称号:", "性别:"};
    QFWDlib.NPCSexType = {
        CS.XiaWorld.g_emNpcSex.None, CS.XiaWorld.g_emNpcSex.Male,
        CS.XiaWorld.g_emNpcSex.Female
    };
    QFWDlib.NPCBodyType = {
        CS.XiaWorld.g_emNpcBodyType.None, CS.XiaWorld.g_emNpcBodyType.Normal,
        CS.XiaWorld.g_emNpcBodyType.Strong, CS.XiaWorld.g_emNpcBodyType.Big
    };
    QFWDlib.JHNPCGongLevel = {
        CS.XiaWorld.g_emGongStageLevel.None, CS.XiaWorld.g_emGongStageLevel.Qi,
        CS.XiaWorld.g_emGongStageLevel.Dan1,
        CS.XiaWorld.g_emGongStageLevel.Dan2, CS.XiaWorld.g_emGongStageLevel.God,
        CS.XiaWorld.g_emGongStageLevel.God2
    };
    QFWDlib.JHNPCFeature = {
        CS.XiaWorld.g_emJHNpc_Feature.None,
        CS.XiaWorld.g_emJHNpc_Feature.NoFeature,
        CS.XiaWorld.g_emJHNpc_Feature.Weak, CS.XiaWorld.g_emJHNpc_Feature.Naive,
        CS.XiaWorld.g_emJHNpc_Feature.Greedy,
        CS.XiaWorld.g_emJHNpc_Feature.Tenacity,
        CS.XiaWorld.g_emJHNpc_Feature.Apathy
    };
    QFWDlib.NPCNeedType = {
        CS.XiaWorld.g_emNeedType.None, CS.XiaWorld.g_emNeedType.Food,
        CS.XiaWorld.g_emNeedType.Water, CS.XiaWorld.g_emNeedType.Rest,
        CS.XiaWorld.g_emNeedType.Fun, CS.XiaWorld.g_emNeedType.Practice,
        CS.XiaWorld.g_emNeedType.GodPower, CS.XiaWorld.g_emNeedType.MindState,
        CS.XiaWorld.g_emNeedType.Demons
    };
    QFWDlib.AllAchievements = {};
    QFWDlib.FBTypes = {
        CS.XiaWorld.g_emItemLable.None, CS.XiaWorld.g_emItemLable.Wood,
        CS.XiaWorld.g_emItemLable.WoodBlock, CS.XiaWorld.g_emItemLable.Rock,
        CS.XiaWorld.g_emItemLable.RockBlock, -- 5
        CS.XiaWorld.g_emItemLable.Metal, CS.XiaWorld.g_emItemLable.Plant,
        CS.XiaWorld.g_emItemLable.PlantProduct,
        CS.XiaWorld.g_emItemLable.Ingredient, CS.XiaWorld.g_emItemLable.Meat,
        -- 10
        CS.XiaWorld.g_emItemLable.Leather, CS.XiaWorld.g_emItemLable.Cloth,
        CS.XiaWorld.g_emItemLable.Bone, CS.XiaWorld.g_emItemLable.Weapon,
        CS.XiaWorld.g_emItemLable.FightFabao, -- 15
        CS.XiaWorld.g_emItemLable.TreasureFabao, CS.XiaWorld.g_emItemLable.Hat,
        CS.XiaWorld.g_emItemLable.Clothes, CS.XiaWorld.g_emItemLable.Trousers,
        CS.XiaWorld.g_emItemLable.Food, -- 20
        CS.XiaWorld.g_emItemLable.Drug, CS.XiaWorld.g_emItemLable.Dan,
        CS.XiaWorld.g_emItemLable.Spell, CS.XiaWorld.g_emItemLable.Tool,
        CS.XiaWorld.g_emItemLable.MetalBlock, -- 25
        CS.XiaWorld.g_emItemLable.Esoterica,
        CS.XiaWorld.g_emItemLable.LeftoverMaterial,
        CS.XiaWorld.g_emItemLable.SpellPaper,
        CS.XiaWorld.g_emItemLable.LingStone, CS.XiaWorld.g_emItemLable.Garbage,
        -- 30
        CS.XiaWorld.g_emItemLable.SoulCrystal,
        CS.XiaWorld.g_emItemLable.Treasure, CS.XiaWorld.g_emItemLable.Influence,
        CS.XiaWorld.g_emItemLable.SPStuffCategories,
        CS.XiaWorld.g_emItemLable.Other
        -- 35
    };
    QFWDlib.ItemsElementTypes = {
        CS.XiaWorld.g_emElementKind.None, CS.XiaWorld.g_emElementKind.Jin,
        CS.XiaWorld.g_emElementKind.Mu, CS.XiaWorld.g_emElementKind.Shui,
        CS.XiaWorld.g_emElementKind.Huo, CS.XiaWorld.g_emElementKind.Tu,
        CS.XiaWorld.g_emElementKind.Chaos
    };
    QFWDlib.LogicBool = {false, true};
    QFWDlib.ItemsFBAttribute = {
        -- CS.XiaWorld.Fight.g_emFaBaoP.None,
        -- CS.XiaWorld.Fight.g_emFaBaoP.AttackPower,
        CS.XiaWorld.Fight.g_emFaBaoP.LingRecover,
        CS.XiaWorld.Fight.g_emFaBaoP.MaxLing,
        CS.XiaWorld.Fight.g_emFaBaoP.FlySpeed,
        CS.XiaWorld.Fight.g_emFaBaoP.RotSpeed,
        CS.XiaWorld.Fight.g_emFaBaoP.KnockBackAddition,
        CS.XiaWorld.Fight.g_emFaBaoP.KnockBackResistance,
        CS.XiaWorld.Fight.g_emFaBaoP.Scale,
        CS.XiaWorld.Fight.g_emFaBaoP.TailLenght,
        CS.XiaWorld.Fight.g_emFaBaoP.AttackRate,
        CS.XiaWorld.Fight.g_emFaBaoP.AttackPower
        -- CS.XiaWorld.Fight.g_emFaBaoP.MoveSpeed,
    };
    QFWDlib.TangAttribute = {
        "名字:Name", "掌握:Mastery", "堂主:Master", "堂号:ID",
        "面积:Area", "关闭:Close(1.false 2.true)"
    };
    QFWDlib.TitleTypes = {
        -- CS.XiaWorld.Fight.g_emFaBaoP.None,
        CS.XiaWorld.g_emNpcTitleType.Normal, CS.XiaWorld.g_emNpcTitleType.Tang,
        CS.XiaWorld.g_emNpcTitleType.TangMaster,
        CS.XiaWorld.g_emNpcTitleType.GodName
    };
    QFWDlib.NeedTypes = {
        CS.XiaWorld.g_emNeedType.None, CS.XiaWorld.g_emNeedType.Food,
        CS.XiaWorld.g_emNeedType.Water, CS.XiaWorld.g_emNeedType.Rest,
        CS.XiaWorld.g_emNeedType.Fun, CS.XiaWorld.g_emNeedType.Practice,
        CS.XiaWorld.g_emNeedType.GodPower, CS.XiaWorld.g_emNeedType.MindState,
        CS.XiaWorld.g_emNeedType.Demons
    };
    QFWDlib.NeedTypesName = {
        "无:None", "食物:Food", "水分:Water", "精神:Rest", "娱乐:Fun",
        "精元:Practice", "神性:GodPower", "人性:MindState",
        "恶念?:Demons"
    };
    QFWDlib.JobAttributeDisplayName = {
        "显示名:DisplayName", "真名:Name", "驱动类名:DriverClass",
        "描述:Desc", "父动画:ParentAni", "隐藏进程:HideProgress",
        "检查停留:CheckStay", "低优先级:LowOrder",
        "行为主角:BehavioursSort", "工作ID:ID", "工作者ID:WorkerId",
        "父工作ID:ParentJobID", "禁止打断:CantInterruptJob",
        "禁止掉落:DontDrop", "完成:IsFinished", "需要命令:NeedCMD",
        "被其他锁定:LockerFixByOther"
    };
    QFWDlib.ThingDirs = {
        CS.XiaWorld.g_emThingDir.Up, CS.XiaWorld.g_emThingDir.Right,
        CS.XiaWorld.g_emThingDir.Down, CS.XiaWorld.g_emThingDir.Left
    };
    QFWDlib.FileTypes = {"建筑", "物品", "植物", "地形", "屋顶"};
    QFWDlib.MapAttributeTypesName = {"附加值P", "附加值V", "基础值"};
    QFWDlib.MapAttributeTypes = {
        CS.XiaWorld.g_emMapEffectKind.Light,
        CS.XiaWorld.g_emMapEffectKind.Tempture,
        CS.XiaWorld.g_emMapEffectKind.Ling,
        CS.XiaWorld.g_emMapEffectKind.LingAddion,
        CS.XiaWorld.g_emMapEffectKind.Fertility,
        CS.XiaWorld.g_emMapEffectKind.Beauty,
        CS.XiaWorld.g_emMapEffectKind.MoveLock,
        CS.XiaWorld.g_emMapEffectKind.Jin, CS.XiaWorld.g_emMapEffectKind.Mu,
        CS.XiaWorld.g_emMapEffectKind.Shui, CS.XiaWorld.g_emMapEffectKind.Huo,
        CS.XiaWorld.g_emMapEffectKind.Tu, CS.XiaWorld.g_emMapEffectKind.Chaos
    };
    QFWDlib.MapAttributeTypesDisplay = {
        "Light", "Tempture", "Ling", "LingAddion", "Fertility", "Beauty",
        "MoveLock", "Jin", "Mu", "Shui", "Huo", "Tu", "Chaos"
    };
    QFWDlib.NpcRichLable = {
        CS.XiaWorld.g_emNpcRichLable.Poorest, CS.XiaWorld.g_emNpcRichLable.Poor,
        CS.XiaWorld.g_emNpcRichLable.Normal, CS.XiaWorld.g_emNpcRichLable.Rich,
        CS.XiaWorld.g_emNpcRichLable.Richest
    };
    QFWDlib.FightCamp = {
        CS.XiaWorld.Fight.g_emFightCamp.None,
        CS.XiaWorld.Fight.g_emFightCamp.Player,
        CS.XiaWorld.Fight.g_emFightCamp.Friend,
        CS.XiaWorld.Fight.g_emFightCamp.Enemy
    };
    QFWDlib.NpcSkillType = {
        CS.XiaWorld.g_emNpcSkillType.None, CS.XiaWorld.g_emNpcSkillType.Fight,
        CS.XiaWorld.g_emNpcSkillType.Qi,
        CS.XiaWorld.g_emNpcSkillType.SocialContact,
        CS.XiaWorld.g_emNpcSkillType.Medicine,
        CS.XiaWorld.g_emNpcSkillType.Cooking,
        CS.XiaWorld.g_emNpcSkillType.Building,
        CS.XiaWorld.g_emNpcSkillType.Farming,
        CS.XiaWorld.g_emNpcSkillType.Mining, CS.XiaWorld.g_emNpcSkillType.Art,
        CS.XiaWorld.g_emNpcSkillType.Manual, CS.XiaWorld.g_emNpcSkillType.DouFa,
        CS.XiaWorld.g_emNpcSkillType.DanQi, CS.XiaWorld.g_emNpcSkillType.Fabao,
        CS.XiaWorld.g_emNpcSkillType.FightSkill,
        CS.XiaWorld.g_emNpcSkillType.Barrier, CS.XiaWorld.g_emNpcSkillType.Zhen
    };
    QFWDlib.NpcSpecailFlag = {
        CS.XiaWorld.g_emNpcSpecailFlag.None, -- 0x04000CD2 RID: 3282
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOMAGIC, -- 0x04000CD3 RID: 3283
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_FIGHTHIDE, -- 0x04000CD4 RID: 3284
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_LEFTHANDED, -- 0x04000CD5 RID: 3285
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_LAME, -- 0x04000CD6 RID: 3286
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_OPPOSITESEXANI_M,
        -- 0x04000CD7 RID: 3287
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_OPPOSITESEXANI_F,
        -- 0x04000CD8 RID: 3288
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_HAVEUMBRELLA,
        -- 0x04000CD9 RID: 3289
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_CANNOT_UNEQUPT,
        -- 0x04000CDA RID: 3290
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_DISSATISFACTION,
        -- 0x04000CDB RID: 3291
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_BASEPRACTICE,
        -- 0x04000CDC RID: 3292
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NEGATIVETIME,
        -- 0x04000CDD RID: 3293
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NONEED, -- 0x04000CDE RID: 3294
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_MAGICDAMAGE,
        -- 0x04000CDF RID: 3295
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOCOMMUNICATE,
        -- 0x04000CE0 RID: 3296
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOMOOD, -- 0x04000CE1 RID: 3297
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_MAGIC, -- 0x04000CE2 RID: 3298
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOTNEGATIVE,
        -- 0x04000CE3 RID: 3299
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_ISVISTOR, -- 0x04000CE4 RID: 3300
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_Healing_Damage,
        -- 0x04000CE5 RID: 3301
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_Healing_Physique,
        -- 0x04000CE6 RID: 3302
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_Healing_Intelligence,
        -- 0x04000CE7 RID: 3303
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_Healing_Charisma,
        -- 0x04000CE8 RID: 3304
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_Healing_Perception,
        -- 0x04000CE9 RID: 3305
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_AbsorbGong_5,
        -- 0x04000CEA RID: 3306
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_AbsorbGong_6,
        -- 0x04000CEB RID: 3307
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_AbsorbGong_9,
        -- 0x04000CEC RID: 3308
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_SACRIFICIAL,
        -- 0x04000CED RID: 3309
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOLING, -- 0x04000CEE RID: 3310
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_TREATSLEEP, -- 0x04000CEF RID: 3311
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_RUNAWAY, -- 0x04000CF0 RID: 3312
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_FLYGAWALY, -- 0x04000CF1 RID: 3313
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_PRACTICEDIE,
        -- 0x04000CF2 RID: 3314
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_SeachSoul, -- 0x04000CF3 RID: 3315
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_MAGICING, -- 0x04000CF4 RID: 3316
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NoDemon, -- 0x04000CF5 RID: 3317
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_ANIMAL_LEAVEMAP,
        -- 0x04000CF6 RID: 3318
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_FREEPATH, -- 0x04000CF7 RID: 3319
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_PRACTIVING, -- 0x04000CF8 RID: 3320
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_THUNDERING, -- 0x04000CF9 RID: 3321
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_ISFREE, -- 0x04000CFA RID: 3322
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOFIGHT, -- 0x04000CFB RID: 3323
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_DROPSOULCRYSTAL,
        -- 0x04000CFC RID: 3324
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_ISTEACHER, -- 0x04000CFD RID: 3325
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_BEPICK, -- 0x04000CFE RID: 3326
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOTRUNAWAY, -- 0x04000CFF RID: 3327
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_FLAG, -- 0x04000D00 RID: 3328
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOSLEEP, -- 0x04000D01 RID: 3329
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NYFOLLOW, -- 0x04000D02 RID: 3330
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_CANTSELECT, -- 0x04000D03 RID: 3331
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_GLODTITLE, -- 0x04000D04 RID: 3332
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_EXPLORESTAY,
        -- 0x04000D05 RID: 3333
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_CANTEXPLORESTAY,
        -- 0x04000D06 RID: 3334
        CS.XiaWorld.g_emNpcSpecailFlag.FALG_LINGXIZHOU, -- 0x04000D07 RID: 3335
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_WUYINKESHEN,
        -- 0x04000D08 RID: 3336
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_CANTBEMAGIC,
        -- 0x04000D09 RID: 3337
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOENTERSKILL,
        -- 0x04000D0A RID: 3338
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_GODMODE, -- 0x04000D0B RID: 3339
        CS.XiaWorld.g_emNpcSpecailFlag.FLGH_NOTEATPRACTICEFOOD,
        -- 0x04000D0C RID: 3340
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_CANTSCAN, -- 0x04000D0D RID: 3341
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_ZHUSHI_CUITI,
        -- 0x04000D0E RID: 3342
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_CANNOT_USEITEM,
        -- 0x04000D0F RID: 3343
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_VISTOR_FLAG,
        -- 0x04000D10 RID: 3344
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_CONCEALMENT,
        -- 0x04000D11 RID: 3345
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_ITEM_RESURRECTION,
        -- 0x04000D12 RID: 3346
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_ADDTIONFLY, -- 0x04000D13 RID: 3347
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_ADDTIONLINGMAX,
        -- 0x04000D14 RID: 3348
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_SUPPRESSGODCALL,
        -- 0x04000D15 RID: 3349
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_MINDHOLD, -- 0x04000D16 RID: 3350
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOMOODADD, -- 0x04000D17 RID: 3351
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_LOCKMINDSTATE,
        -- 0x04000D18 RID: 3352
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_GODPRACTICE_GODLIKE,
        -- 0x04000D19 RID: 3353
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_INVISIBLE_THING,
        -- 0x04000D1A RID: 3354
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_LISTENGODWISH,
        -- 0x04000D1B RID: 3355
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_BEJIANGHUINVITE,
        -- 0x04000D1C RID: 3356
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_MUTE, -- 0x04000D1D RID: 3357
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_NOSOUL, -- 0x04000D1E RID: 3358
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_SILENT, -- 0x04000D1F RID: 3359
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_CANTRECOVERYLING,
        -- 0x04000D20 RID: 3360
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_FIGHTDRIVERDEATH,
        -- 0x04000D21 RID: 3361
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_COMPULSORYCOMMUNICATION,
        -- 0x04000D22 RID: 3362
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_OVERLAYFOG, -- 0x04000D23 RID: 3363
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_USEMAGIC, -- 0x04000D24 RID: 3364
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_WHITEHAIR,

        CS.XiaWorld.g_emNpcSpecailFlag.SkillSing, -- 0x04000D27 RID: 3367
        CS.XiaWorld.g_emNpcSpecailFlag.OutFireCount, -- 0x04000D28 RID: 3368
        CS.XiaWorld.g_emNpcSpecailFlag.CarryKind, -- 0x04000D29 RID: 3369
        CS.XiaWorld.g_emNpcSpecailFlag.HelperType, -- 0x04000D2A RID: 3370
        CS.XiaWorld.g_emNpcSpecailFlag.WaitHelping, -- 0x04000D2B RID: 3371
        CS.XiaWorld.g_emNpcSpecailFlag.LostHand, -- 0x04000D2C RID: 3372
        CS.XiaWorld.g_emNpcSpecailFlag.LostEye, -- 0x04000D2D RID: 3373
        CS.XiaWorld.g_emNpcSpecailFlag.WaitReceive, -- 0x04000D2E RID: 3374
        CS.XiaWorld.g_emNpcSpecailFlag.MapExploring, -- 0x04000D2F RID: 3375
        CS.XiaWorld.g_emNpcSpecailFlag.WorkBroken, -- 0x04000D30 RID: 3376
        CS.XiaWorld.g_emNpcSpecailFlag.BrokenNeck, -- 0x04000D31 RID: 3377
        CS.XiaWorld.g_emNpcSpecailFlag.WaitDefection, -- 0x04000D32 RID: 3378
        CS.XiaWorld.g_emNpcSpecailFlag.NpcBindPuppet, -- 0x04000D33 RID: 3379
        CS.XiaWorld.g_emNpcSpecailFlag.PuppetBindNpc, -- 0x04000D34 RID: 3380
        CS.XiaWorld.g_emNpcSpecailFlag.TeachFlag, -- 0x04000D35 RID: 3381
        CS.XiaWorld.g_emNpcSpecailFlag.PuppetFrom, -- 0x04000D36 RID: 3382
        CS.XiaWorld.g_emNpcSpecailFlag.NoFog_Wait4Use, -- 0x04000D37 RID: 3383
        CS.XiaWorld.g_emNpcSpecailFlag.NeedSarifice, -- 0x04000D38 RID: 3384
        CS.XiaWorld.g_emNpcSpecailFlag.FightMapNpcIndex,
        -- 0x04000D39 RID: 3385
        CS.XiaWorld.g_emNpcSpecailFlag.In_ZhenId, -- 0x04000D3A RID: 3386
        CS.XiaWorld.g_emNpcSpecailFlag.ZhenStarting, -- 0x04000D3B RID: 3387
        CS.XiaWorld.g_emNpcSpecailFlag.FightMapElderSeed,
        -- 0x04000D3C RID: 3388
        CS.XiaWorld.g_emNpcSpecailFlag.RunningAreaId, -- 0x04000D3D RID: 3389
        CS.XiaWorld.g_emNpcSpecailFlag.RunningAreaId2, -- 0x04000D3E RID: 3390
        CS.XiaWorld.g_emNpcSpecailFlag.Is_ZhenCore, -- 0x04000D3F RID: 3391
        CS.XiaWorld.g_emNpcSpecailFlag.CancelZhenRecover,
        -- 0x04000D40 RID: 3392
        CS.XiaWorld.g_emNpcSpecailFlag.GodFabaoID, -- 0x04000D41 RID: 3393
        CS.XiaWorld.g_emNpcSpecailFlag.GodFabaoOwnerID, -- 0x04000D42 RID: 3394
        CS.XiaWorld.g_emNpcSpecailFlag.NoLeaveMap, -- 0x04000D43 RID: 3395
        CS.XiaWorld.g_emNpcSpecailFlag.AuctionPunish, -- 0x04000D44 RID: 3396
        CS.XiaWorld.g_emNpcSpecailFlag.CanEscapeFromAuction,
        -- 0x04000D45 RID: 3397
        CS.XiaWorld.g_emNpcSpecailFlag.GodPowerEffectCount,
        -- 0x04000D46 RID: 3398
        CS.XiaWorld.g_emNpcSpecailFlag.JianghuLocaltionSeed,
        -- 0x04000D47 RID: 3399
        CS.XiaWorld.g_emNpcSpecailFlag.FightMapStayNpcIndex,
        -- 0x04000D48 RID: 3400
        CS.XiaWorld.g_emNpcSpecailFlag.GodPowerEffectCountA,
        -- 0x04000D49 RID: 3401
        CS.XiaWorld.g_emNpcSpecailFlag.GodPowerEffectCountB,
        -- 0x04000D4A RID: 3402
        CS.XiaWorld.g_emNpcSpecailFlag.HufaciyuCount, -- 0x04000D4B RID: 3403
        CS.XiaWorld.g_emNpcSpecailFlag.FLAG_INFHP_PUPPET
    };
    QFWDlib.FengshuiItemLocal = {
        CS.XiaWorld.g_emFengshuiItemLocal.None,
        CS.XiaWorld.g_emFengshuiItemLocal.Corner,
        CS.XiaWorld.g_emFengshuiItemLocal.CornerThree,
        CS.XiaWorld.g_emFengshuiItemLocal.StickingWall,
        CS.XiaWorld.g_emFengshuiItemLocal.DontStickingWall,
        CS.XiaWorld.g_emFengshuiItemLocal.BesideDoor,
        CS.XiaWorld.g_emFengshuiItemLocal._NORMAL_END_,
        CS.XiaWorld.g_emFengshuiItemLocal._BESIDE_ROOM_BEGIN_,
        CS.XiaWorld.g_emFengshuiItemLocal.BesideBedRoom,
        CS.XiaWorld.g_emFengshuiItemLocal.BesideAncestorRoom,
        CS.XiaWorld.g_emFengshuiItemLocal.BesideWorkRoom,
        CS.XiaWorld.g_emFengshuiItemLocal.BesideBaoRoom,
        CS.XiaWorld.g_emFengshuiItemLocal.BesideDanRoom,
        CS.XiaWorld.g_emFengshuiItemLocal.BesideKitchen,
        CS.XiaWorld.g_emFengshuiItemLocal._BESIDE_ROOM_END_,
        CS.XiaWorld.g_emFengshuiItemLocal._DONTBESIDE_ROOM_BEGIN_,
        CS.XiaWorld.g_emFengshuiItemLocal.DnotBesideBedRoom,
        CS.XiaWorld.g_emFengshuiItemLocal.DnotBesideAncestorRoom,
        CS.XiaWorld.g_emFengshuiItemLocal.DnotBesideWorkRoom,
        CS.XiaWorld.g_emFengshuiItemLocal.DnotBesideBaoRoom,
        CS.XiaWorld.g_emFengshuiItemLocal.DnotBesideDanRoom,
        CS.XiaWorld.g_emFengshuiItemLocal.DnotBesideKitchen,
        CS.XiaWorld.g_emFengshuiItemLocal._DONTBESIDE_ROOM_END_,
        CS.XiaWorld.g_emFengshuiItemLocal._COUNT
    };
    QFWDlib.FengshuiRank = {
        CS.XiaWorld.g_emFengshuiRank.None, CS.XiaWorld.g_emFengshuiRank.Best,
        CS.XiaWorld.g_emFengshuiRank.VeryGood,
        CS.XiaWorld.g_emFengshuiRank.Good, CS.XiaWorld.g_emFengshuiRank.Bad,
        CS.XiaWorld.g_emFengshuiRank.VeryBad, CS.XiaWorld.g_emFengshuiRank.Worst
    };
    QFWDlib.RoomKind = {
        CS.XiaWorld.g_emRoomKind.None, CS.XiaWorld.g_emRoomKind.BedRoom,
        CS.XiaWorld.g_emRoomKind.AncestorRoom,
        CS.XiaWorld.g_emRoomKind.WorkRoom, CS.XiaWorld.g_emRoomKind.BaoRoom,
        CS.XiaWorld.g_emRoomKind.DanRoom, CS.XiaWorld.g_emRoomKind.Kitchen,
        CS.XiaWorld.g_emRoomKind.StorageRoom
    };
    QFWDlib.EnemyType = {
        CS.XiaWorld.Fight.g_emEnemyType.None,
        CS.XiaWorld.Fight.g_emEnemyType.Attacker,
        CS.XiaWorld.Fight.g_emEnemyType.Joiner,
        CS.XiaWorld.Fight.g_emEnemyType.PlayerAttacker,
        CS.XiaWorld.Fight.g_emEnemyType.Defender
    };
    QFWDlib.NpcBodyType = {
        CS.XiaWorld.g_emNpcBodyType.None, CS.XiaWorld.g_emNpcBodyType.Normal,
        CS.XiaWorld.g_emNpcBodyType.Strong, CS.XiaWorld.g_emNpcBodyType.Big
    };
    QFWDlib.MindStateLevel = {
        CS.XiaWorld.g_emMindStateLevel.Lv0, CS.XiaWorld.g_emMindStateLevel.Lv1,
        CS.XiaWorld.g_emMindStateLevel.Lv2, CS.XiaWorld.g_emMindStateLevel.Lv3,
        CS.XiaWorld.g_emMindStateLevel.Lv4, CS.XiaWorld.g_emMindStateLevel.Lv5,
        CS.XiaWorld.g_emMindStateLevel.Lv6
    };
    QFWDlib.FabaoSpecialAbility = {
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.None,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.HitCountAddDamage,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.FlyDamageAddP,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.HitCountCostSkill,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.CantAttack,

        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.AtkRateDamageAddp,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.HitSameFabaoAndEffect,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.HitCountAddMirror,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.HitAddRecovery,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.FunctionEffectPower,

        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.HitCountAddSubColdDown,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.MultiKillAddPowerUp,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.DanCountAddPowerUp,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.Sync_AddFlag,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.Sync_AddEquptData,

        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.Sync_AddEquptDataModifier,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.AgeAddPowerUp,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.FristHitPowerUp,
        CS.XiaWorld.Fight.g_emFabaoSpecialAbility.LastLingCostPowerUp
    }; -- LogicBool
    QFWDlib.FengshuiItemSpecial = {};
    QFWDlib.SchoolRelationRank = {
        CS.XiaWorld.g_emSchoolRelationRank.None,
        CS.XiaWorld.g_emSchoolRelationRank.Hatred,
        CS.XiaWorld.g_emSchoolRelationRank.Hostility,
        CS.XiaWorld.g_emSchoolRelationRank.Cold,
        CS.XiaWorld.g_emSchoolRelationRank.Neutral,
        CS.XiaWorld.g_emSchoolRelationRank.Friendly,
        CS.XiaWorld.g_emSchoolRelationRank.Respect
    };
    QFWDlib.ThingDir = {
        CS.XiaWorld.g_emThingDir.None, CS.XiaWorld.g_emThingDir.Up,
        CS.XiaWorld.g_emThingDir.Right, CS.XiaWorld.g_emThingDir.Down,
        CS.XiaWorld.g_emThingDir.Left
    };
    QFWDlib.NpcTitleType = {
        CS.XiaWorld.g_emNpcTitleType.Normal, CS.XiaWorld.g_emNpcTitleType.Tang,
        CS.XiaWorld.g_emNpcTitleType.TangMaster,
        CS.XiaWorld.g_emNpcTitleType.GodName
    };
    QFWDlib.NpcRank = {
        CS.XiaWorld.g_emNpcRank.Normal, CS.XiaWorld.g_emNpcRank.Worker,
        CS.XiaWorld.g_emNpcRank.Disciple, CS.XiaWorld.g_emNpcRank.Joiner
    };
    QFWDlib.EquipType = {
        CS.XiaWorld.g_emEquipType.None, CS.XiaWorld.g_emEquipType.Weapon,
        CS.XiaWorld.g_emEquipType.Hat, CS.XiaWorld.g_emEquipType.Clothes,
        CS.XiaWorld.g_emEquipType.Trousers, CS.XiaWorld.g_emEquipType.Esoterica,
        -- 6
        CS.XiaWorld.g_emEquipType.AtkFabao, CS.XiaWorld.g_emEquipType.AtkFabao2,
        CS.XiaWorld.g_emEquipType.AtkFabao3,
        CS.XiaWorld.g_emEquipType.AtkFabao4,
        CS.XiaWorld.g_emEquipType.AtkFabao5,
        CS.XiaWorld.g_emEquipType.AtkFabao6, -- 12
        CS.XiaWorld.g_emEquipType.Fu1, CS.XiaWorld.g_emEquipType.Fu2,
        CS.XiaWorld.g_emEquipType.Fu3, CS.XiaWorld.g_emEquipType.Fu4,
        CS.XiaWorld.g_emEquipType.Fu5, CS.XiaWorld.g_emEquipType.Fu6, -- 18
        CS.XiaWorld.g_emEquipType.Tool1, CS.XiaWorld.g_emEquipType.Tool2,
        CS.XiaWorld.g_emEquipType.Tool3, CS.XiaWorld.g_emEquipType.Tool4,
        CS.XiaWorld.g_emEquipType.Tool5, CS.XiaWorld.g_emEquipType.Tool6, -- 24
        CS.XiaWorld.g_emEquipType.Tool7, CS.XiaWorld.g_emEquipType.Tool8,
        CS.XiaWorld.g_emEquipType.Tool9, CS.XiaWorld.g_emEquipType.Tool10,
        -- 28
        CS.XiaWorld.g_emEquipType.Cell1, CS.XiaWorld.g_emEquipType.Cell2,
        CS.XiaWorld.g_emEquipType.Cell3, CS.XiaWorld.g_emEquipType.Cell4,
        CS.XiaWorld.g_emEquipType.Cell5, CS.XiaWorld.g_emEquipType.Cell6
        -- 34
    };

    QFWDlib.ColliderKind = {
        CS.XiaWorld.g_emColliderKind.None, CS.XiaWorld.g_emColliderKind.Open,
        CS.XiaWorld.g_emColliderKind.Slow, CS.XiaWorld.g_emColliderKind.Across,
        CS.XiaWorld.g_emColliderKind.ThrowOver,
        CS.XiaWorld.g_emColliderKind.NoPass
    };
    QFWDlib.SpParts = {
        "SuperPart_Gong_1_1", "SuperPart_Gong_1_1_1", "SuperPart_Gong_1_2",
        "SuperPart_Gong_1_3", "SuperPart_Gong_1_4", "SuperPart_Gong_1_5",
        "SuperPart_Gong_1_6", "SuperPart_Gong_1_7", "SuperPart_Gong_1_8",
        "SuperPart_Gong_1_9", "SuperPart_Gong_1_10", "SuperPart_Gong_1_11",
        "SuperPart_Gong_1_11_1", "SuperPart_Gong_2_1", "SuperPart_Gong_2_1_1",
        "SuperPart_Gong_2_2", "SuperPart_Gong_2_2_1", "SuperPart_Gong_2_3",
        "SuperPart_Gong_2_4", "SuperPart_Gong_2_4_1", "SuperPart_Gong_2_5",
        "SuperPart_Gong_2_6", "SuperPart_Gong_2_7", "SuperPart_Gong_2_8",
        "SuperPart_Gong_2_9", "SuperPart_Gong_2_10", "SuperPart_Gong_2_11",
        "SuperPart_Gong_3_1", "SuperPart_Gong_3_2", "SuperPart_Gong_3_3",
        "SuperPart_Gong_3_4", "SuperPart_Gong_3_5", "SuperPart_Gong_3_6",
        "SuperPart_Gong_3_7", "SuperPart_Gong_3_8", "SuperPart_Gong_3_9",
        "SuperPart_Gong_3_10", "SuperPart_Gong_3_11", "SuperPart_Gong_3_12",
        "SuperPart_Gong_5_1", "SuperPart_Gong_5_1_1", "SuperPart_Gong_5_2",
        "SuperPart_Gong_5_3", "SuperPart_Gong_5_4", "SuperPart_Gong_5_5",
        "SuperPart_Gong_5_6", "SuperPart_Gong_5_7", "SuperPart_Gong_5_8",
        "SuperPart_Gong_5_9", "SuperPart_Gong_5_10", "SuperPart_Gong_5_11",
        "SuperPart_Bear_1", "SuperPart_Bear_2", "SuperPart_Boar_1",
        "SuperPart_Boar_2", "SuperPart_Cat_1", "SuperPart_Cat_2",
        "SuperPart_Cattle_1", "SuperPart_Cattle_2", "SuperPart_Chicken_1",
        "SuperPart_Chicken_2", "SuperPart_Chicken_3", "SuperPart_Forg_1",
        "SuperPart_Forg_2", "SuperPart_Human_1", "SuperPart_Rabbit_1",
        "SuperPart_Rabbit_2", "SuperPart_Tiger_1", "SuperPart_Tiger_2",
        "SuperPart_Turtle_1", "SuperPart_Wolf_1", "SuperPart_Wolf_2",
        "_SYS_CORE_"
    };
    QFWDlib.BodyPractice_Property = {
        CS.XiaWorld.g_emBodyPractice_Property.None,
        CS.XiaWorld.g_emBodyPractice_Property.AtkPower,
        CS.XiaWorld.g_emBodyPractice_Property.DefPower,
        CS.XiaWorld.g_emBodyPractice_Property.AtkRate,
        CS.XiaWorld.g_emBodyPractice_Property.DefRate,
        CS.XiaWorld.g_emBodyPractice_Property.ArmorPenetration,
        CS.XiaWorld.g_emBodyPractice_Property.CatchFabao,
        CS.XiaWorld.g_emBodyPractice_Property.FightCost,
        CS.XiaWorld.g_emBodyPractice_Property.RecoverQi,
        CS.XiaWorld.g_emBodyPractice_Property.ResistanceJin,
        CS.XiaWorld.g_emBodyPractice_Property.ResistanceMu,
        CS.XiaWorld.g_emBodyPractice_Property.ResistanceShui,
        CS.XiaWorld.g_emBodyPractice_Property.ResistanceHuo,
        CS.XiaWorld.g_emBodyPractice_Property.ResistanceTu,
        CS.XiaWorld.g_emBodyPractice_Property.Count
    };
    QFWDlib.SuperPartEquptKind = {
        CS.XiaWorld.g_emSuperPartEquptKind.None,
        CS.XiaWorld.g_emSuperPartEquptKind.Attack,
        CS.XiaWorld.g_emSuperPartEquptKind.Defense,
        CS.XiaWorld.g_emSuperPartEquptKind.Effect,
        CS.XiaWorld.g_emSuperPartEquptKind.Count
    };
    QFWDlib.BodyPractice_Property = {
        CS.XiaWorld.g_emBodyPractice_Property.None,
        CS.XiaWorld.g_emBodyPractice_Property.AtkPower,
        CS.XiaWorld.g_emBodyPractice_Property.DefPower,
        CS.XiaWorld.g_emBodyPractice_Property.AtkRate,
        CS.XiaWorld.g_emBodyPractice_Property.DefRate,
        CS.XiaWorld.g_emBodyPractice_Property.ArmorPenetration,
        CS.XiaWorld.g_emBodyPractice_Property.CatchFabao,
        CS.XiaWorld.g_emBodyPractice_Property.FightCost,
        CS.XiaWorld.g_emBodyPractice_Property.RecoverQi,
        CS.XiaWorld.g_emBodyPractice_Property.ResistanceJin,
        CS.XiaWorld.g_emBodyPractice_Property.ResistanceMu,
        CS.XiaWorld.g_emBodyPractice_Property.ResistanceShui,
        CS.XiaWorld.g_emBodyPractice_Property.ResistanceHuo,
        CS.XiaWorld.g_emBodyPractice_Property.ResistanceTu,
        CS.XiaWorld.g_emBodyPractice_Property.Count
    };
    QFWDlib.BodyPractice_Methods = {
        "BPQuenchingMethods_test1", "BPQuenchingMethods_test2",
        "BPQuenchingMethods_test3", "BPQuenchingMethods_1",
        "BPQuenchingMethods_1_1", "BPQuenchingMethods_2",
        "BPQuenchingMethods_3", "BPQuenchingMethods_4", "BPQuenchingMethods_5",
        "BPQuenchingMethods_6", "BPQuenchingMethods_Sp1",
        "BPQuenchingMethods_Sp2", "BPQuenchingMethods_Sp3",
        "BPQuenchingMethods_ReQuenching", "LostPart", "SYS_DamageMethod",
        "SYS_RebuildMethod", "SYS_yishan"
    };
    QFWDlib.BodyPractice_Attitude = {
        "Test3", "LostPart", "SYS_ATK", "SYS_NORMAL", "BPAttitudes_ManJi",
        "BPAttitudes_WangZhe"
    };
    QFWDlib.SchoolState = {
        CS.XiaWorld.g_emSchoolState.None, CS.XiaWorld.g_emSchoolState.Normal,
        CS.XiaWorld.g_emSchoolState.Close, CS.XiaWorld.g_emSchoolState.Die
    };
    QFWDlib.IllHandType = {
        CS.IllHandType.None, CS.IllHandType.AllItem, CS.IllHandType.MiaoFa,
        CS.IllHandType.ZhongShen, CS.IllHandType.Environmental,
        CS.IllHandType.HongChen
    };
    QFWDlib.IllHandLabel = {
        CS.IllHandLabel.None, CS.IllHandLabel.Dan, CS.IllHandLabel.Baowu,
        CS.IllHandLabel.Treasure, CS.IllHandLabel.Spell,
        CS.IllHandLabel.Curiosity, CS.IllHandLabel.FSItem,
        CS.IllHandLabel.DOther, CS.IllHandLabel.Equip, CS.IllHandLabel.Food,
        CS.IllHandLabel.Material, CS.IllHandLabel.WOther, CS.IllHandLabel.Gong,
        CS.IllHandLabel.ShangGuZhen, CS.IllHandLabel.SlotSuit,
        CS.IllHandLabel.Magic, CS.IllHandLabel.Animal, CS.IllHandLabel.JYAnimal,
        CS.IllHandLabel.Boss, CS.IllHandLabel.LsAnimal,
        CS.IllHandLabel.YsAnimal, CS.IllHandLabel.Building,
        CS.IllHandLabel.Plant, CS.IllHandLabel.Weather, CS.IllHandLabel.School,
        CS.IllHandLabel.Place, CS.IllHandLabel.MapStory,
        CS.IllHandLabel.Practice, CS.IllHandLabel.NaturalWonders,
        CS.IllHandLabel.Fish, CS.IllHandLabel.Dele
    };
    if CS.XiaWorld.g_emRPGNpcAIMoveType ~= nil then
        QFWDlib.RPGNpcAIMoveType = {
            CS.XiaWorld.g_emRPGNpcAIMoveType.None,
            CS.XiaWorld.g_emRPGNpcAIMoveType.Free,
            CS.XiaWorld.g_emRPGNpcAIMoveType.Stay,
            CS.XiaWorld.g_emRPGNpcAIMoveType.Patrol,
            CS.XiaWorld.g_emRPGNpcAIMoveType.Route
        }
    else
        QFWDlib.RPGNpcAIMoveType = {};
    end
    QFWDlib.HaveIn = true;
    return true;
end
