.class public Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;
.super Ljava/lang/Object;
.source "BluetoothPbapVcardManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;,
        Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    }
.end annotation


# static fields
.field static final CALLLOG_SORT_ORDER:Ljava/lang/String; = "_id DESC"

.field private static final CLAUSE_ONLY_VISIBLE:Ljava/lang/String; = "in_visible_group=1"

.field static final CONTACTS_ID_COLUMN_INDEX:I = 0x0

.field static final CONTACTS_NAME_COLUMN_INDEX:I = 0x1

.field static final CONTACTS_PROJECTION:[Ljava/lang/String;

.field private static final D:Z = true

.field static final PHONES_PROJECTION:[Ljava/lang/String;

.field private static final PHONE_NUMBER_COLUMN_INDEX:I = 0x3

.field static final SORT_ORDER_PHONE_NUMBER:Ljava/lang/String; = "data1 ASC"

.field private static final TAG:Ljava/lang/String; = "BluetoothPbapVcardManager"

.field private static final V:Z = true


# instance fields
.field private mContext:Landroid/content/Context;

.field private mIOTSolutionOn:Z

.field private mMTKSearchNumber:Z

.field private mResolver:Landroid/content/ContentResolver;

.field private mSearchCallLogOn:Z


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 86
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "data2"

    aput-object v1, v0, v4

    const-string v1, "data3"

    aput-object v1, v0, v5

    const/4 v1, 0x3

    const-string v2, "data1"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "display_name"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->PHONES_PROJECTION:[Ljava/lang/String;

    .line 98
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "_id"

    aput-object v1, v0, v3

    const-string v1, "display_name"

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->CONTACTS_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 124
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 108
    iput-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mIOTSolutionOn:Z

    .line 111
    iput-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mMTKSearchNumber:Z

    .line 114
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mSearchCallLogOn:Z

    .line 125
    iput-object p1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    .line 126
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    .line 127
    iput-boolean v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mIOTSolutionOn:Z

    .line 128
    return-void
.end method

.method private final getCurrentCountry()Ljava/lang/String;
    .locals 4

    .prologue
    .line 400
    const-string v0, ""

    .line 401
    .local v0, "currentCountry":Ljava/lang/String;
    iget-object v2, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    const-string v3, "country_detector"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/location/CountryDetector;

    .line 402
    .local v1, "detector":Landroid/location/CountryDetector;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/location/CountryDetector;->detectCountry()Landroid/location/Country;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 403
    invoke-virtual {v1}, Landroid/location/CountryDetector;->detectCountry()Landroid/location/Country;

    move-result-object v2

    invoke-virtual {v2}, Landroid/location/Country;->getCountryIso()Ljava/lang/String;

    move-result-object v0

    .line 405
    :cond_0
    return-object v0
.end method

.method private getIOTSolution()Z
    .locals 1

    .prologue
    .line 135
    iget-boolean v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mIOTSolutionOn:Z

    return v0
.end method

.method private final getOwnerPhoneNumberVcardFromProfile(Z[B)Ljava/lang/String;
    .locals 4
    .param p1, "vcardType21"    # Z
    .param p2, "filter"    # [B

    .prologue
    .line 143
    const-string v1, "BluetoothPbapVcardManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[PBAP]getOwnerPhoneNumberVcardFromProfile vcardType21 = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    if-eqz p1, :cond_1

    .line 147
    const/high16 v0, -0x40000000    # -2.0f

    .line 152
    .local v0, "vcardType":I
    :goto_0
    invoke-static {}, Lcom/android/bluetooth/pbap/BluetoothPbapConfig;->includePhotosInVcard()Z

    move-result v1

    if-nez v1, :cond_0

    .line 153
    const/high16 v1, 0x800000

    or-int/2addr v0, v1

    .line 156
    :cond_0
    iget-object v1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    invoke-static {v1, v0, p2}, Lcom/android/bluetooth/pbap/BluetoothPbapUtils;->createProfileVCard(Landroid/content/Context;I[B)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 149
    .end local v0    # "vcardType":I
    :cond_1
    const v0, -0x3fffffff    # -2.0000002f

    .restart local v0    # "vcardType":I
    goto :goto_0
.end method

.method private final getSelectionForPhonebook(I)Ljava/lang/String;
    .locals 3
    .param p1, "type"    # I

    .prologue
    const/4 v2, 0x6

    .line 179
    const/4 v0, 0x0

    .line 180
    .local v0, "selection":Ljava/lang/String;
    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    .line 181
    invoke-direct {p0}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->getIOTSolution()Z

    move-result v1

    if-nez v1, :cond_1

    .line 182
    const-string v0, "indicate_phone_or_sim_contact=-1"

    .line 196
    :goto_0
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_5

    .line 197
    if-eq p1, v2, :cond_0

    .line 200
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " AND "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "in_visible_group=1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    :goto_1
    move-object v1, v0

    .line 210
    :goto_2
    return-object v1

    .line 184
    :cond_1
    const-string v0, ""

    goto :goto_0

    .line 186
    :cond_2
    if-ne p1, v2, :cond_4

    .line 187
    invoke-direct {p0}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->getIOTSolution()Z

    move-result v1

    if-nez v1, :cond_3

    .line 188
    const-string v0, "indicate_phone_or_sim_contact>-1"

    goto :goto_0

    .line 190
    :cond_3
    const-string v0, "in_visible_group=1000"

    goto :goto_0

    .line 193
    :cond_4
    const-string v1, "BluetoothPbapVcardManager"

    const-string v2, "getSelectionForPhonebook() type is invalid"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    const/4 v1, 0x0

    goto :goto_2

    .line 203
    :cond_5
    if-eq p1, v2, :cond_6

    .line 204
    const-string v0, "in_visible_group=1"

    goto :goto_1

    .line 206
    :cond_6
    const-string v0, ""

    goto :goto_1
.end method


# virtual methods
.method public StripTelephoneNumber(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "vCard"    # Ljava/lang/String;

    .prologue
    .line 791
    const-string v3, "line.separator"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 792
    .local v1, "attr":[Ljava/lang/String;
    const-string v0, ""

    .line 793
    .local v0, "Vcard":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    .line 794
    aget-object v3, v1, v2

    const-string v4, "TEL"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 795
    aget-object v3, v1, v2

    const-string v4, "("

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 796
    aget-object v3, v1, v2

    const-string v4, ")"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 797
    aget-object v3, v1, v2

    const-string v4, "-"

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 798
    aget-object v3, v1, v2

    const-string v4, " "

    const-string v5, ""

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 793
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 802
    :cond_1
    const/4 v2, 0x0

    :goto_1
    array-length v3, v1

    if-ge v2, v3, :cond_3

    .line 803
    aget-object v3, v1, v2

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 804
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v4, v1, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 802
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 807
    :cond_3
    const-string v3, "BluetoothPbapVcardManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Vcard with stripped telephone no.: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 808
    return-object v0
.end method

.method public final composeAndSendCallLogVcards(ILjavax/obex/Operation;IIZZ[B)I
    .locals 22
    .param p1, "type"    # I
    .param p2, "op"    # Ljavax/obex/Operation;
    .param p3, "startPoint"    # I
    .param p4, "endPoint"    # I
    .param p5, "vcardType21"    # Z
    .param p6, "ignorefilter"    # Z
    .param p7, "filter"    # [B

    .prologue
    .line 483
    const/4 v2, 0x1

    move/from16 v0, p3

    if-lt v0, v2, :cond_0

    move/from16 v0, p3

    move/from16 v1, p4

    if-le v0, v1, :cond_1

    .line 484
    :cond_0
    const-string v2, "BluetoothPbapVcardManager"

    const-string v6, "internal error: startPoint or endPoint is not correct."

    invoke-static {v2, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 485
    const/16 v2, 0xd0

    .line 542
    :goto_0
    return v2

    .line 487
    :cond_1
    invoke-static/range {p1 .. p1}, Lcom/android/bluetooth/pbap/BluetoothPbapObexServer;->createSelectionPara(I)Ljava/lang/String;

    move-result-object v5

    .line 489
    .local v5, "typeSelection":Ljava/lang/String;
    sget-object v3, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    .line 490
    .local v3, "myUri":Landroid/net/Uri;
    const/4 v2, 0x1

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v6, "_id"

    aput-object v6, v4, v2

    .line 493
    .local v4, "CALLLOG_PROJECTION":[Ljava/lang/String;
    const/4 v14, 0x0

    .line 495
    .local v14, "ID_COLUMN_INDEX":I
    const/4 v15, 0x0

    .line 496
    .local v15, "callsCursor":Landroid/database/Cursor;
    const-wide/16 v20, 0x0

    .line 497
    .local v20, "startPointId":J
    const-wide/16 v18, 0x0

    .line 500
    .local v18, "endPointId":J
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    const/4 v6, 0x0

    const-string v7, "_id DESC"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 502
    if-eqz v15, :cond_2

    .line 503
    add-int/lit8 v2, p3, -0x1

    invoke-interface {v15, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 504
    const/4 v2, 0x0

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v20

    .line 505
    const-string v2, "BluetoothPbapVcardManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Call Log query startPointId = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v0, v20

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    move/from16 v0, p3

    move/from16 v1, p4

    if-ne v0, v1, :cond_4

    .line 507
    move-wide/from16 v18, v20

    .line 512
    :goto_1
    const-string v2, "BluetoothPbapVcardManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Call log query endPointId = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v0, v18

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 517
    :cond_2
    if-eqz v15, :cond_3

    .line 518
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 519
    const/4 v15, 0x0

    .line 524
    :cond_3
    :goto_2
    move/from16 v0, p3

    move/from16 v1, p4

    if-ne v0, v1, :cond_6

    .line 525
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "_id="

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, v20

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 534
    .local v17, "recordSelection":Ljava/lang/String;
    :goto_3
    if-nez v5, :cond_7

    .line 535
    move-object/from16 v8, v17

    .line 540
    .local v8, "selection":Ljava/lang/String;
    :goto_4
    const-string v2, "BluetoothPbapVcardManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Call log query selection is: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 542
    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v6, p0

    move-object/from16 v7, p2

    move/from16 v9, p5

    move/from16 v12, p6

    move-object/from16 v13, p7

    invoke-virtual/range {v6 .. v13}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->composeAndSendVCards(Ljavax/obex/Operation;Ljava/lang/String;ZLjava/lang/String;ZZ[B)I

    move-result v2

    goto/16 :goto_0

    .line 509
    .end local v8    # "selection":Ljava/lang/String;
    .end local v17    # "recordSelection":Ljava/lang/String;
    :cond_4
    add-int/lit8 v2, p4, -0x1

    :try_start_1
    invoke-interface {v15, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 510
    const/4 v2, 0x0

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getLong(I)J
    :try_end_1
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v18

    goto :goto_1

    .line 514
    :catch_0
    move-exception v16

    .line 515
    .local v16, "e":Landroid/database/CursorWindowAllocationException;
    :try_start_2
    const-string v2, "BluetoothPbapVcardManager"

    const-string v6, "CursorWindowAllocationException while composing calllog vcards"

    invoke-static {v2, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 517
    if-eqz v15, :cond_3

    .line 518
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 519
    const/4 v15, 0x0

    goto :goto_2

    .line 517
    .end local v16    # "e":Landroid/database/CursorWindowAllocationException;
    :catchall_0
    move-exception v2

    if-eqz v15, :cond_5

    .line 518
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 519
    const/4 v15, 0x0

    :cond_5
    throw v2

    .line 529
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "_id>="

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, v18

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, " AND "

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, "_id"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, "<="

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, v20

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .restart local v17    # "recordSelection":Ljava/lang/String;
    goto :goto_3

    .line 537
    :cond_7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "("

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, ") AND ("

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, ")"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .restart local v8    # "selection":Ljava/lang/String;
    goto/16 :goto_4
.end method

.method public final composeAndSendPhonebookOneVcard(Ljavax/obex/Operation;IIZLjava/lang/String;IZ[B)I
    .locals 18
    .param p1, "op"    # Ljavax/obex/Operation;
    .param p2, "type"    # I
    .param p3, "offset"    # I
    .param p4, "vcardType21"    # Z
    .param p5, "ownerVCard"    # Ljava/lang/String;
    .param p6, "orderByWhat"    # I
    .param p7, "ignorefilter"    # Z
    .param p8, "filter"    # [B

    .prologue
    .line 602
    const/4 v2, 0x1

    move/from16 v0, p3

    if-ge v0, v2, :cond_0

    .line 603
    const-string v2, "BluetoothPbapVcardManager"

    const-string v4, "Internal error: offset is not correct."

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 604
    const/16 v2, 0xd0

    .line 658
    :goto_0
    return v2

    .line 606
    :cond_0
    sget-object v3, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 607
    .local v3, "myUri":Landroid/net/Uri;
    const/4 v14, 0x0

    .line 608
    .local v14, "contactCursor":Landroid/database/Cursor;
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->getSelectionForPhonebook(I)Ljava/lang/String;

    move-result-object v5

    .line 609
    .local v5, "selection":Ljava/lang/String;
    const-wide/16 v16, 0x0

    .line 611
    .local v16, "contactId":J
    if-nez v5, :cond_1

    .line 612
    const-string v2, "BluetoothPbapVcardManager"

    const-string v4, "internal error: composeAndSendPhonebookOneVcard(), type is invalid"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 613
    const/16 v2, 0xd0

    goto :goto_0

    .line 616
    :cond_1
    sget v2, Lcom/android/bluetooth/pbap/BluetoothPbapObexServer;->ORDER_BY_INDEXED:I

    move/from16 v0, p6

    if-ne v0, v2, :cond_5

    .line 618
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    sget-object v4, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->CONTACTS_PROJECTION:[Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "_id"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 620
    if-eqz v14, :cond_2

    .line 621
    add-int/lit8 v2, p3, -0x1

    invoke-interface {v14, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 622
    const/4 v2, 0x0

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    .line 623
    const-string v2, "BluetoothPbapVcardManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Query startPointId = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, v16

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 628
    :cond_2
    if-eqz v14, :cond_3

    .line 629
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 630
    const/4 v14, 0x0

    .line 654
    :cond_3
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, v16

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 656
    const-string v2, "BluetoothPbapVcardManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Query selection is: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 658
    const/4 v11, 0x1

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object v8, v5

    move/from16 v9, p4

    move-object/from16 v10, p5

    move/from16 v12, p7

    move-object/from16 v13, p8

    invoke-virtual/range {v6 .. v13}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->composeAndSendVCards(Ljavax/obex/Operation;Ljava/lang/String;ZLjava/lang/String;ZZ[B)I

    move-result v2

    goto/16 :goto_0

    .line 625
    :catch_0
    move-exception v15

    .line 626
    .local v15, "e":Landroid/database/CursorWindowAllocationException;
    :try_start_1
    const-string v2, "BluetoothPbapVcardManager"

    const-string v4, "CursorWindowAllocationException while composing phonebook one vcard order by index"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 628
    if-eqz v14, :cond_3

    .line 629
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 630
    const/4 v14, 0x0

    goto :goto_1

    .line 628
    .end local v15    # "e":Landroid/database/CursorWindowAllocationException;
    :catchall_0
    move-exception v2

    if-eqz v14, :cond_4

    .line 629
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 630
    const/4 v14, 0x0

    :cond_4
    throw v2

    .line 633
    :cond_5
    sget v2, Lcom/android/bluetooth/pbap/BluetoothPbapObexServer;->ORDER_BY_ALPHABETICAL:I

    move/from16 v0, p6

    if-ne v0, v2, :cond_8

    .line 635
    :try_start_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    sget-object v4, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->CONTACTS_PROJECTION:[Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "display_name"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 637
    if-eqz v14, :cond_6

    .line 638
    add-int/lit8 v2, p3, -0x1

    invoke-interface {v14, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 639
    const/4 v2, 0x0

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    .line 640
    const-string v2, "BluetoothPbapVcardManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Query startPointId = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, v16

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 645
    :cond_6
    if-eqz v14, :cond_3

    .line 646
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 647
    const/4 v14, 0x0

    goto/16 :goto_1

    .line 642
    :catch_1
    move-exception v15

    .line 643
    .restart local v15    # "e":Landroid/database/CursorWindowAllocationException;
    :try_start_3
    const-string v2, "BluetoothPbapVcardManager"

    const-string v4, "CursorWindowAllocationException while composing phonebook one vcard order by alphabetical"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 645
    if-eqz v14, :cond_3

    .line 646
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 647
    const/4 v14, 0x0

    goto/16 :goto_1

    .line 645
    .end local v15    # "e":Landroid/database/CursorWindowAllocationException;
    :catchall_1
    move-exception v2

    if-eqz v14, :cond_7

    .line 646
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 647
    const/4 v14, 0x0

    :cond_7
    throw v2

    .line 651
    :cond_8
    const-string v2, "BluetoothPbapVcardManager"

    const-string v4, "Parameter orderByWhat is not supported!"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 652
    const/16 v2, 0xd0

    goto/16 :goto_0
.end method

.method public final composeAndSendPhonebookVcards(Ljavax/obex/Operation;IIIZLjava/lang/String;Z[B)I
    .locals 20
    .param p1, "op"    # Ljavax/obex/Operation;
    .param p2, "type"    # I
    .param p3, "startPoint"    # I
    .param p4, "endPoint"    # I
    .param p5, "vcardType21"    # Z
    .param p6, "ownerVCard"    # Ljava/lang/String;
    .param p7, "ignorefilter"    # Z
    .param p8, "filter"    # [B

    .prologue
    .line 548
    const/4 v2, 0x1

    move/from16 v0, p3

    if-lt v0, v2, :cond_0

    move/from16 v0, p3

    move/from16 v1, p4

    if-le v0, v1, :cond_1

    .line 549
    :cond_0
    const-string v2, "BluetoothPbapVcardManager"

    const-string v4, "internal error: startPoint or endPoint is not correct."

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 550
    const/16 v2, 0xd0

    .line 595
    :goto_0
    return v2

    .line 552
    :cond_1
    sget-object v3, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 553
    .local v3, "myUri":Landroid/net/Uri;
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->getSelectionForPhonebook(I)Ljava/lang/String;

    move-result-object v5

    .line 554
    .local v5, "selection":Ljava/lang/String;
    if-nez v5, :cond_2

    .line 555
    const-string v2, "BluetoothPbapVcardManager"

    const-string v4, "internal error: composeAndSendPhonebookVcards(), type is invalid"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 556
    const/16 v2, 0xd0

    goto :goto_0

    .line 559
    :cond_2
    const/4 v14, 0x0

    .line 560
    .local v14, "contactCursor":Landroid/database/Cursor;
    const-wide/16 v18, 0x0

    .line 561
    .local v18, "startPointId":J
    const-wide/16 v16, 0x0

    .line 563
    .local v16, "endPointId":J
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    sget-object v4, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->CONTACTS_PROJECTION:[Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "_id"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 565
    if-eqz v14, :cond_3

    .line 566
    add-int/lit8 v2, p3, -0x1

    invoke-interface {v14, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 567
    const/4 v2, 0x0

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v18

    .line 568
    const-string v2, "BluetoothPbapVcardManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Query startPointId = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, v18

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    move/from16 v0, p3

    move/from16 v1, p4

    if-ne v0, v1, :cond_5

    .line 570
    move-wide/from16 v16, v18

    .line 575
    :goto_1
    const-string v2, "BluetoothPbapVcardManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Query endPointId = "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, v16

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 580
    :cond_3
    if-eqz v14, :cond_4

    .line 581
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 582
    const/4 v14, 0x0

    .line 586
    :cond_4
    :goto_2
    move/from16 v0, p3

    move/from16 v1, p4

    if-ne v0, v1, :cond_7

    .line 587
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, v18

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " AND "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 593
    :goto_3
    const-string v2, "BluetoothPbapVcardManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Query selection is: "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 595
    const/4 v11, 0x1

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object v8, v5

    move/from16 v9, p5

    move-object/from16 v10, p6

    move/from16 v12, p7

    move-object/from16 v13, p8

    invoke-virtual/range {v6 .. v13}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->composeAndSendVCards(Ljavax/obex/Operation;Ljava/lang/String;ZLjava/lang/String;ZZ[B)I

    move-result v2

    goto/16 :goto_0

    .line 572
    :cond_5
    add-int/lit8 v2, p4, -0x1

    :try_start_1
    invoke-interface {v14, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 573
    const/4 v2, 0x0

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getLong(I)J
    :try_end_1
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v16

    goto :goto_1

    .line 577
    :catch_0
    move-exception v15

    .line 578
    .local v15, "e":Landroid/database/CursorWindowAllocationException;
    :try_start_2
    const-string v2, "BluetoothPbapVcardManager"

    const-string v4, "CursorWindowAllocationException while composing phonebook vcards"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 580
    if-eqz v14, :cond_4

    .line 581
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 582
    const/4 v14, 0x0

    goto :goto_2

    .line 580
    .end local v15    # "e":Landroid/database/CursorWindowAllocationException;
    :catchall_0
    move-exception v2

    if-eqz v14, :cond_6

    .line 581
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 582
    const/4 v14, 0x0

    :cond_6
    throw v2

    .line 589
    :cond_7
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id>="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, v18

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " AND "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "_id"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "<="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-wide/from16 v0, v16

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " AND "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_3
.end method

.method public final composeAndSendVCards(Ljavax/obex/Operation;Ljava/lang/String;ZLjava/lang/String;ZZ[B)I
    .locals 18
    .param p1, "op"    # Ljavax/obex/Operation;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "vcardType21"    # Z
    .param p4, "ownerVCard"    # Ljava/lang/String;
    .param p5, "isContacts"    # Z
    .param p6, "ignorefilter"    # Z
    .param p7, "filter"    # [B

    .prologue
    .line 665
    const-wide/16 v8, 0x0

    .line 666
    .local v8, "timestamp":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 668
    if-eqz p5, :cond_10

    .line 669
    const/4 v6, 0x0

    .line 670
    .local v6, "composer":Lcom/android/vcard/VCardComposer;
    new-instance v12, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;

    if-eqz p6, :cond_4

    const/4 v13, 0x0

    :goto_0
    invoke-direct {v12, v13}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;-><init>([B)V

    .line 672
    .local v12, "vcardfilter":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;
    const/4 v4, 0x0

    .line 676
    .local v4, "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    if-eqz p3, :cond_5

    .line 677
    const/high16 v11, -0x40000000    # -2.0f

    .line 681
    .local v11, "vcardType":I
    :goto_1
    :try_start_0
    invoke-virtual {v12}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;->isPhotoEnabled()Z

    move-result v13

    if-nez v13, :cond_0

    .line 682
    const/high16 v13, 0x800000

    or-int/2addr v11, v13

    .line 686
    :cond_0
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    move-object/from16 v0, p7

    invoke-static {v13, v11, v0}, Lcom/android/bluetooth/pbap/BluetoothPbapUtils;->createFilteredVCardComposer(Landroid/content/Context;I[B)Lcom/android/vcard/VCardComposer;

    move-result-object v6

    .line 691
    new-instance v13, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$1;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$1;-><init>(Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;)V

    invoke-virtual {v6, v13}, Lcom/android/vcard/VCardComposer;->setPhoneNumberTranslationCallback(Lcom/android/vcard/VCardPhoneNumberTranslationCallback;)V

    .line 704
    new-instance v5, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    invoke-direct {v5, v0, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;-><init>(Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;Ljavax/obex/Operation;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 705
    .end local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .local v5, "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    :try_start_1
    sget-object v13, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    const/4 v14, 0x0

    const-string v15, "_id"

    move-object/from16 v0, p2

    invoke-virtual {v6, v13, v0, v14, v15}, Lcom/android/vcard/VCardComposer;->init(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_1

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v13}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onInit(Landroid/content/Context;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    move-result v13

    if-nez v13, :cond_6

    .line 707
    :cond_1
    const/16 v13, 0xd0

    .line 735
    if-eqz v6, :cond_2

    .line 736
    invoke-virtual {v6}, Lcom/android/vcard/VCardComposer;->terminate()V

    .line 738
    :cond_2
    if-eqz v5, :cond_3

    .line 739
    invoke-virtual {v5}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onTerminate()V

    .line 787
    .end local v6    # "composer":Lcom/android/vcard/VCardComposer;
    .end local v11    # "vcardType":I
    .end local v12    # "vcardfilter":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;
    .end local p1    # "op":Ljavax/obex/Operation;
    :cond_3
    :goto_2
    return v13

    .end local v5    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .restart local v6    # "composer":Lcom/android/vcard/VCardComposer;
    .restart local p1    # "op":Ljavax/obex/Operation;
    :cond_4
    move-object/from16 v13, p7

    .line 670
    goto :goto_0

    .line 679
    .restart local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .restart local v12    # "vcardfilter":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;
    :cond_5
    const v11, -0x3fffffff    # -2.0000002f

    .restart local v11    # "vcardType":I
    goto :goto_1

    .line 710
    .end local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .restart local v5    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    :cond_6
    :try_start_2
    invoke-virtual {v6}, Lcom/android/vcard/VCardComposer;->isAfterLast()Z

    move-result v13

    if-nez v13, :cond_7

    .line 711
    sget-boolean v13, Lcom/android/bluetooth/pbap/BluetoothPbapObexServer;->sIsAborted:Z

    if-eqz v13, :cond_a

    .line 712
    check-cast p1, Ljavax/obex/ServerOperation;

    .end local p1    # "op":Ljavax/obex/Operation;
    const/4 v13, 0x1

    move-object/from16 v0, p1

    iput-boolean v13, v0, Ljavax/obex/ServerOperation;->isAborted:Z

    .line 713
    const/4 v13, 0x0

    sput-boolean v13, Lcom/android/bluetooth/pbap/BluetoothPbapObexServer;->sIsAborted:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 735
    :cond_7
    if-eqz v6, :cond_8

    .line 736
    invoke-virtual {v6}, Lcom/android/vcard/VCardComposer;->terminate()V

    .line 738
    :cond_8
    if-eqz v5, :cond_9

    .line 739
    invoke-virtual {v5}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onTerminate()V

    .line 784
    .end local v6    # "composer":Lcom/android/vcard/VCardComposer;
    .end local v11    # "vcardType":I
    .end local v12    # "vcardfilter":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;
    :cond_9
    :goto_3
    const-string v13, "BluetoothPbapVcardManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Total vcard composing and sending out takes "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v16

    sub-long v16, v16, v8

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " ms"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 787
    const/16 v13, 0xa0

    goto :goto_2

    .line 716
    .restart local v6    # "composer":Lcom/android/vcard/VCardComposer;
    .restart local v11    # "vcardType":I
    .restart local v12    # "vcardfilter":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;
    .restart local p1    # "op":Ljavax/obex/Operation;
    :cond_a
    :try_start_3
    invoke-virtual {v6}, Lcom/android/vcard/VCardComposer;->createOneEntry()Ljava/lang/String;

    move-result-object v10

    .line 717
    .local v10, "vcard":Ljava/lang/String;
    if-nez v10, :cond_c

    .line 718
    const-string v13, "BluetoothPbapVcardManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Failed to read a contact. Error reason: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v6}, Lcom/android/vcard/VCardComposer;->getErrorReason()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    .line 720
    const/16 v13, 0xd0

    .line 735
    if-eqz v6, :cond_b

    .line 736
    invoke-virtual {v6}, Lcom/android/vcard/VCardComposer;->terminate()V

    .line 738
    :cond_b
    if-eqz v5, :cond_3

    .line 739
    invoke-virtual {v5}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onTerminate()V

    goto :goto_2

    .line 722
    :cond_c
    :try_start_4
    const-string v13, "BluetoothPbapVcardManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "vCard from composer: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 724
    move/from16 v0, p3

    invoke-virtual {v12, v10, v0}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;->apply(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v10

    .line 725
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->StripTelephoneNumber(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 727
    const-string v13, "BluetoothPbapVcardManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "vCard after cleanup: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 729
    invoke-virtual {v5, v10}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onEntryCreated(Ljava/lang/String;)Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    move-result v13

    if-nez v13, :cond_6

    .line 731
    const/16 v13, 0xd0

    .line 735
    if-eqz v6, :cond_d

    .line 736
    invoke-virtual {v6}, Lcom/android/vcard/VCardComposer;->terminate()V

    .line 738
    :cond_d
    if-eqz v5, :cond_3

    .line 739
    invoke-virtual {v5}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onTerminate()V

    goto/16 :goto_2

    .line 735
    .end local v5    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .end local v10    # "vcard":Ljava/lang/String;
    .restart local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    :catchall_0
    move-exception v13

    .end local p1    # "op":Ljavax/obex/Operation;
    :goto_4
    if-eqz v6, :cond_e

    .line 736
    invoke-virtual {v6}, Lcom/android/vcard/VCardComposer;->terminate()V

    .line 738
    :cond_e
    if-eqz v4, :cond_f

    .line 739
    invoke-virtual {v4}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onTerminate()V

    :cond_f
    throw v13

    .line 743
    .end local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .end local v6    # "composer":Lcom/android/vcard/VCardComposer;
    .end local v11    # "vcardType":I
    .end local v12    # "vcardfilter":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;
    .restart local p1    # "op":Ljavax/obex/Operation;
    :cond_10
    const/4 v6, 0x0

    .line 744
    .local v6, "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    const/4 v4, 0x0

    .line 747
    .restart local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    :try_start_5
    new-instance v7, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    invoke-direct {v7, v13}, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;-><init>(Landroid/content/Context;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 748
    .end local v6    # "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    .local v7, "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    :try_start_6
    new-instance v5, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p4

    invoke-direct {v5, v0, v1, v2}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;-><init>(Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;Ljavax/obex/Operation;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 749
    .end local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .restart local v5    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    :try_start_7
    sget-object v13, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    const/4 v14, 0x0

    const-string v15, "_id DESC"

    move-object/from16 v0, p2

    invoke-virtual {v7, v13, v0, v14, v15}, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;->init(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_11

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v13}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onInit(Landroid/content/Context;)Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    move-result v13

    if-nez v13, :cond_14

    .line 752
    :cond_11
    const/16 v13, 0xd0

    .line 775
    if-eqz v7, :cond_12

    .line 776
    invoke-virtual {v7}, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;->terminate()V

    .line 778
    :cond_12
    if-eqz v5, :cond_3

    .line 779
    invoke-virtual {v5}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onTerminate()V

    goto/16 :goto_2

    .line 768
    .restart local v10    # "vcard":Ljava/lang/String;
    :cond_13
    :try_start_8
    const-string v13, "BluetoothPbapVcardManager"

    const-string v14, "Vcard Entry:"

    invoke-static {v13, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 769
    const-string v13, "BluetoothPbapVcardManager"

    invoke-static {v13, v10}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 772
    invoke-virtual {v5, v10}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onEntryCreated(Ljava/lang/String;)Z

    .line 755
    .end local v10    # "vcard":Ljava/lang/String;
    :cond_14
    invoke-virtual {v7}, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;->isAfterLast()Z

    move-result v13

    if-nez v13, :cond_15

    .line 756
    sget-boolean v13, Lcom/android/bluetooth/pbap/BluetoothPbapObexServer;->sIsAborted:Z

    if-eqz v13, :cond_17

    .line 757
    check-cast p1, Ljavax/obex/ServerOperation;

    .end local p1    # "op":Ljavax/obex/Operation;
    const/4 v13, 0x1

    move-object/from16 v0, p1

    iput-boolean v13, v0, Ljavax/obex/ServerOperation;->isAborted:Z

    .line 758
    const/4 v13, 0x0

    sput-boolean v13, Lcom/android/bluetooth/pbap/BluetoothPbapObexServer;->sIsAborted:Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 775
    :cond_15
    if-eqz v7, :cond_16

    .line 776
    invoke-virtual {v7}, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;->terminate()V

    .line 778
    :cond_16
    if-eqz v5, :cond_9

    .line 779
    invoke-virtual {v5}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onTerminate()V

    goto/16 :goto_3

    .line 761
    .restart local p1    # "op":Ljavax/obex/Operation;
    :cond_17
    :try_start_9
    move/from16 v0, p3

    invoke-virtual {v7, v0}, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;->createOneEntry(Z)Ljava/lang/String;

    move-result-object v10

    .line 762
    .restart local v10    # "vcard":Ljava/lang/String;
    if-nez v10, :cond_13

    .line 763
    const-string v13, "BluetoothPbapVcardManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Failed to read a contact. Error reason: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v7}, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;->getErrorReason()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    .line 765
    const/16 v13, 0xd0

    .line 775
    if-eqz v7, :cond_18

    .line 776
    invoke-virtual {v7}, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;->terminate()V

    .line 778
    :cond_18
    if-eqz v5, :cond_3

    .line 779
    invoke-virtual {v5}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onTerminate()V

    goto/16 :goto_2

    .line 775
    .end local v5    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .end local v7    # "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    .end local v10    # "vcard":Ljava/lang/String;
    .restart local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .restart local v6    # "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    :catchall_1
    move-exception v13

    .end local p1    # "op":Ljavax/obex/Operation;
    :goto_5
    if-eqz v6, :cond_19

    .line 776
    invoke-virtual {v6}, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;->terminate()V

    .line 778
    :cond_19
    if-eqz v4, :cond_1a

    .line 779
    invoke-virtual {v4}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;->onTerminate()V

    :cond_1a
    throw v13

    .line 775
    .end local v6    # "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    .restart local v7    # "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    .restart local p1    # "op":Ljavax/obex/Operation;
    :catchall_2
    move-exception v13

    move-object v6, v7

    .end local v7    # "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    .restart local v6    # "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    goto :goto_5

    .end local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .end local v6    # "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    .end local p1    # "op":Ljavax/obex/Operation;
    .restart local v5    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .restart local v7    # "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    :catchall_3
    move-exception v13

    move-object v4, v5

    .end local v5    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .restart local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    move-object v6, v7

    .end local v7    # "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    .restart local v6    # "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    goto :goto_5

    .line 735
    .end local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .restart local v5    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .local v6, "composer":Lcom/android/vcard/VCardComposer;
    .restart local v11    # "vcardType":I
    .restart local v12    # "vcardfilter":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$VCardFilter;
    :catchall_4
    move-exception v13

    move-object v4, v5

    .end local v5    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    .restart local v4    # "buffer":Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager$HandlerForStringBuffer;
    goto/16 :goto_4
.end method

.method public final getCallHistorySize(I)I
    .locals 9
    .param p1, "type"    # I

    .prologue
    .line 255
    sget-object v1, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    .line 256
    .local v1, "myUri":Landroid/net/Uri;
    invoke-static {p1}, Lcom/android/bluetooth/pbap/BluetoothPbapObexServer;->createSelectionPara(I)Ljava/lang/String;

    move-result-object v3

    .line 257
    .local v3, "selection":Ljava/lang/String;
    const/4 v8, 0x0

    .line 258
    .local v8, "size":I
    const/4 v6, 0x0

    .line 260
    .local v6, "callCursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    const/4 v2, 0x0

    const/4 v4, 0x0

    const-string v5, "date DESC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 262
    if-eqz v6, :cond_0

    .line 263
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v8

    .line 268
    :cond_0
    if-eqz v6, :cond_1

    .line 269
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 270
    const/4 v6, 0x0

    .line 273
    :cond_1
    :goto_0
    return v8

    .line 265
    :catch_0
    move-exception v7

    .line 266
    .local v7, "e":Landroid/database/CursorWindowAllocationException;
    :try_start_1
    const-string v0, "BluetoothPbapVcardManager"

    const-string v2, "CursorWindowAllocationException while getting CallHistory size"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 268
    if-eqz v6, :cond_1

    .line 269
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 270
    const/4 v6, 0x0

    goto :goto_0

    .line 268
    .end local v7    # "e":Landroid/database/CursorWindowAllocationException;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_2

    .line 269
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 270
    const/4 v6, 0x0

    :cond_2
    throw v0
.end method

.method public final getContactNamesByNumber(ILjava/lang/String;)Ljava/util/ArrayList;
    .locals 20
    .param p1, "type"    # I
    .param p2, "phoneNumber"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 409
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    .line 410
    .local v16, "nameList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 412
    .local v19, "tempNameList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v8, 0x0

    .line 413
    .local v8, "contactCursor":Landroid/database/Cursor;
    const/4 v3, 0x0

    .line 415
    .local v3, "uri":Landroid/net/Uri;
    invoke-direct/range {p0 .. p1}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->getSelectionForPhonebook(I)Ljava/lang/String;

    move-result-object v5

    .line 416
    .local v5, "selection":Ljava/lang/String;
    if-nez v5, :cond_1

    .line 417
    const-string v2, "BluetoothPbapVcardManager"

    const-string v4, "internal error: getContactNamesByNumber(), type is invalid"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 477
    :cond_0
    return-object v16

    .line 421
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mMTKSearchNumber:Z

    if-eqz v2, :cond_7

    .line 422
    invoke-direct/range {p0 .. p0}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->getCurrentCountry()Ljava/lang/String;

    move-result-object v9

    .line 423
    .local v9, "country":Ljava/lang/String;
    move-object/from16 v0, p2

    move-object/from16 v1, p2

    invoke-static {v0, v1, v9}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 424
    .local v11, "formatedNum":Ljava/lang/String;
    sget-object v3, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    .line 425
    if-eqz p2, :cond_2

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_2

    .line 426
    if-eqz v5, :cond_6

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_6

    .line 427
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "("

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ")"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " AND "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "data1"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " LIKE \'%"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "%\'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " OR "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "data1"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " LIKE \'%"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "%\'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " OR "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "data4"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " LIKE \'%"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "%\'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 447
    .end local v9    # "country":Ljava/lang/String;
    .end local v11    # "formatedNum":Ljava/lang/String;
    :cond_2
    :goto_0
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    sget-object v4, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->CONTACTS_PROJECTION:[Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "_id"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 450
    if-eqz v8, :cond_9

    .line 451
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_1
    invoke-interface {v8}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_9

    .line 453
    const/4 v2, 0x1

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 454
    .local v15, "name":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-interface {v8, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    .line 455
    .local v12, "id":J
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 456
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    const v4, 0x104000e

    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 458
    :cond_3
    const-string v2, "BluetoothPbapVcardManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "got name "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " by number "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " @"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 459
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, ","

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 451
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 462
    .end local v12    # "id":J
    .end local v15    # "name":Ljava/lang/String;
    :catch_0
    move-exception v10

    .line 463
    .local v10, "e":Landroid/database/CursorWindowAllocationException;
    :try_start_1
    const-string v2, "BluetoothPbapVcardManager"

    const-string v4, "CursorWindowAllocationException while getting contact names"

    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 465
    if-eqz v8, :cond_4

    .line 466
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 467
    const/4 v8, 0x0

    .line 470
    .end local v10    # "e":Landroid/database/CursorWindowAllocationException;
    :cond_4
    :goto_2
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v18

    .line 471
    .local v18, "tempListSize":I
    const/4 v14, 0x0

    .local v14, "index":I
    :goto_3
    move/from16 v0, v18

    if-ge v14, v0, :cond_0

    .line 472
    move-object/from16 v0, v19

    invoke-virtual {v0, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    .line 473
    .local v17, "object":Ljava/lang/String;
    invoke-virtual/range {v16 .. v17}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 474
    invoke-virtual/range {v16 .. v17}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 471
    :cond_5
    add-int/lit8 v14, v14, 0x1

    goto :goto_3

    .line 432
    .end local v14    # "index":I
    .end local v17    # "object":Ljava/lang/String;
    .end local v18    # "tempListSize":I
    .restart local v9    # "country":Ljava/lang/String;
    .restart local v11    # "formatedNum":Ljava/lang/String;
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "data1 LIKE \'%"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "%\'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " OR "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "data1"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " LIKE \'%"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "%\'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " OR "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "data4"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, " LIKE \'%"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "%\'"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0

    .line 438
    .end local v9    # "country":Ljava/lang/String;
    .end local v11    # "formatedNum":Ljava/lang/String;
    :cond_7
    if-eqz p2, :cond_8

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_8

    .line 439
    sget-object v3, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    goto/16 :goto_0

    .line 441
    :cond_8
    sget-object v2, Landroid/provider/ContactsContract$Contacts;->CONTENT_FILTER_URI:Landroid/net/Uri;

    invoke-static/range {p2 .. p2}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    goto/16 :goto_0

    .line 465
    :cond_9
    if-eqz v8, :cond_4

    .line 466
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 467
    const/4 v8, 0x0

    goto/16 :goto_2

    .line 465
    :catchall_0
    move-exception v2

    if-eqz v8, :cond_a

    .line 466
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 467
    const/4 v8, 0x0

    :cond_a
    throw v2
.end method

.method public final getContactsSize(I)I
    .locals 9
    .param p1, "type"    # I

    .prologue
    .line 229
    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 230
    .local v1, "myUri":Landroid/net/Uri;
    const/4 v8, 0x0

    .line 232
    .local v8, "size":I
    invoke-direct {p0, p1}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->getSelectionForPhonebook(I)Ljava/lang/String;

    move-result-object v3

    .line 233
    .local v3, "selection":Ljava/lang/String;
    if-nez v3, :cond_0

    .line 234
    const-string v0, "BluetoothPbapVcardManager"

    const-string v2, "internal error: getContactsSize(), type is invalid"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 235
    const/4 v0, 0x0

    .line 251
    :goto_0
    return v0

    .line 237
    :cond_0
    const/4 v6, 0x0

    .line 239
    .local v6, "contactCursor":Landroid/database/Cursor;
    :try_start_0
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 240
    if-eqz v6, :cond_1

    .line 241
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    add-int/lit8 v8, v0, 0x1

    .line 246
    :cond_1
    if-eqz v6, :cond_2

    .line 247
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 248
    const/4 v6, 0x0

    :cond_2
    :goto_1
    move v0, v8

    .line 251
    goto :goto_0

    .line 243
    :catch_0
    move-exception v7

    .line 244
    .local v7, "e":Landroid/database/CursorWindowAllocationException;
    :try_start_1
    const-string v0, "BluetoothPbapVcardManager"

    const-string v2, "CursorWindowAllocationException while getting Contacts size"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 246
    if-eqz v6, :cond_2

    .line 247
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 248
    const/4 v6, 0x0

    goto :goto_1

    .line 246
    .end local v7    # "e":Landroid/database/CursorWindowAllocationException;
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_3

    .line 247
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 248
    const/4 v6, 0x0

    :cond_3
    throw v0
.end method

.method public final getOwnerPhoneNumberVcard(Z[B)Ljava/lang/String;
    .locals 6
    .param p1, "vcardType21"    # Z
    .param p2, "filter"    # [B

    .prologue
    .line 161
    invoke-static {}, Lcom/android/bluetooth/pbap/BluetoothPbapConfig;->useProfileForOwnerVcard()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 162
    invoke-direct {p0, p1, p2}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->getOwnerPhoneNumberVcardFromProfile(Z[B)Ljava/lang/String;

    move-result-object v3

    .line 163
    .local v3, "vcard":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_0

    .line 164
    const-string v4, "BluetoothPbapVcardManager"

    const-string v5, "[PBAP]getOwnerPhoneNumberVcardFromProfile get null or vcard length = 0"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    :goto_0
    return-object v3

    .line 170
    .end local v3    # "vcard":Ljava/lang/String;
    :cond_0
    new-instance v0, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;

    iget-object v4, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v4}, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;-><init>(Landroid/content/Context;)V

    .line 171
    .local v0, "composer":Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;
    invoke-static {}, Lcom/android/bluetooth/pbap/BluetoothPbapService;->getLocalPhoneName()Ljava/lang/String;

    move-result-object v1

    .line 172
    .local v1, "name":Ljava/lang/String;
    invoke-static {}, Lcom/android/bluetooth/pbap/BluetoothPbapService;->getLocalPhoneNum()Ljava/lang/String;

    move-result-object v2

    .line 173
    .local v2, "number":Ljava/lang/String;
    const/4 v4, 0x2

    invoke-virtual {v0, v4, v1, v2, p1}, Lcom/android/bluetooth/pbap/BluetoothPbapCallLogComposer;->composeVCardForPhoneOwnNumber(ILjava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v3

    .line 175
    .restart local v3    # "vcard":Ljava/lang/String;
    goto :goto_0
.end method

.method public final getPhonebookNameList(II)Ljava/util/ArrayList;
    .locals 13
    .param p1, "type"    # I
    .param p2, "orderByWhat"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 347
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 349
    .local v11, "nameList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v12, 0x0

    .line 350
    .local v12, "ownerName":Ljava/lang/String;
    invoke-static {}, Lcom/android/bluetooth/pbap/BluetoothPbapConfig;->useProfileForOwnerVcard()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 351
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/bluetooth/pbap/BluetoothPbapUtils;->getProfileName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v12

    .line 353
    :cond_0
    if-eqz v12, :cond_1

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_2

    .line 354
    :cond_1
    invoke-static {}, Lcom/android/bluetooth/pbap/BluetoothPbapService;->getLocalPhoneName()Ljava/lang/String;

    move-result-object v12

    .line 356
    :cond_2
    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 359
    invoke-direct {p0, p1}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->getSelectionForPhonebook(I)Ljava/lang/String;

    move-result-object v3

    .line 360
    .local v3, "selection":Ljava/lang/String;
    if-nez v3, :cond_4

    .line 361
    const-string v0, "BluetoothPbapVcardManager"

    const-string v2, "internal error: getPhonebookNameList(), type is invalid"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    :cond_3
    :goto_0
    return-object v11

    .line 365
    :cond_4
    sget-object v1, Landroid/provider/ContactsContract$Contacts;->CONTENT_URI:Landroid/net/Uri;

    .line 366
    .local v1, "myUri":Landroid/net/Uri;
    const/4 v6, 0x0

    .line 368
    .local v6, "contactCursor":Landroid/database/Cursor;
    :try_start_0
    sget v0, Lcom/android/bluetooth/pbap/BluetoothPbapObexServer;->ORDER_BY_INDEXED:I

    if-ne p2, v0, :cond_7

    .line 369
    const-string v0, "BluetoothPbapVcardManager"

    const-string v2, "getPhonebookNameList, order by index"

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->CONTACTS_PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 377
    :cond_5
    :goto_1
    if-eqz v6, :cond_8

    .line 378
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_2
    invoke-interface {v6}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_8

    .line 380
    const/4 v0, 0x1

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 381
    .local v10, "name":Ljava/lang/String;
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v8

    .line 382
    .local v8, "id":J
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 383
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    const v2, 0x104000e

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 385
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 378
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 388
    .end local v8    # "id":J
    .end local v10    # "name":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 389
    .local v7, "e":Landroid/database/CursorWindowAllocationException;
    :try_start_1
    const-string v0, "BluetoothPbapVcardManager"

    const-string v2, "CursorWindowAllocationException while getting Phonebook name list"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 391
    if-eqz v6, :cond_3

    .line 392
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 393
    const/4 v6, 0x0

    goto :goto_0

    .line 372
    .end local v7    # "e":Landroid/database/CursorWindowAllocationException;
    :cond_7
    :try_start_2
    sget v0, Lcom/android/bluetooth/pbap/BluetoothPbapObexServer;->ORDER_BY_ALPHABETICAL:I

    if-ne p2, v0, :cond_5

    .line 373
    const-string v0, "BluetoothPbapVcardManager"

    const-string v2, "getPhonebookNameList, order by alpha"

    invoke-static {v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 374
    iget-object v0, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->CONTACTS_PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "display_name"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_2
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v6

    goto :goto_1

    .line 391
    :cond_8
    if-eqz v6, :cond_3

    .line 392
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 393
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 391
    :catchall_0
    move-exception v0

    if-eqz v6, :cond_9

    .line 392
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 393
    const/4 v6, 0x0

    :cond_9
    throw v0
.end method

.method public final getPhonebookSize(I)I
    .locals 4
    .param p1, "type"    # I

    .prologue
    .line 215
    sparse-switch p1, :sswitch_data_0

    .line 221
    invoke-virtual {p0, p1}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->getCallHistorySize(I)I

    move-result v0

    .line 224
    .local v0, "size":I
    :goto_0
    const-string v1, "BluetoothPbapVcardManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getPhonebookSize size = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " type = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    return v0

    .line 218
    .end local v0    # "size":I
    :sswitch_0
    invoke-virtual {p0, p1}, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->getContactsSize(I)I

    move-result v0

    .line 219
    .restart local v0    # "size":I
    goto :goto_0

    .line 215
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x6 -> :sswitch_0
    .end sparse-switch
.end method

.method public final loadCallHistoryList(ILjava/lang/String;Ljava/lang/String;)Landroid/util/SparseArray;
    .locals 25
    .param p1, "type"    # I
    .param p2, "searchVal"    # Ljava/lang/String;
    .param p3, "searchAttr"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Landroid/util/SparseArray",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 277
    sget-object v4, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    .line 278
    .local v4, "myUri":Landroid/net/Uri;
    invoke-static/range {p1 .. p1}, Lcom/android/bluetooth/pbap/BluetoothPbapObexServer;->createSelectionPara(I)Ljava/lang/String;

    move-result-object v10

    .line 279
    .local v10, "allSelection":Ljava/lang/String;
    move-object v6, v10

    .line 280
    .local v6, "selection":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v3, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mSearchCallLogOn:Z

    if-eqz v3, :cond_0

    .line 281
    invoke-static/range {p2 .. p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 282
    if-eqz v6, :cond_2

    .line 283
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, " AND "

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 287
    :goto_0
    const-string v3, "name"

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 288
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "name LIKE \'%"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "%\'"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 294
    :cond_0
    :goto_1
    const/4 v3, 0x4

    new-array v5, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v7, "number"

    aput-object v7, v5, v3

    const/4 v3, 0x1

    const-string v7, "name"

    aput-object v7, v5, v3

    const/4 v3, 0x2

    const-string v7, "presentation"

    aput-object v7, v5, v3

    const/4 v3, 0x3

    const-string v7, "_id"

    aput-object v7, v5, v3

    .line 297
    .local v5, "projection":[Ljava/lang/String;
    const/4 v15, 0x0

    .line 298
    .local v15, "CALLS_NUMBER_COLUMN_INDEX":I
    const/4 v14, 0x1

    .line 299
    .local v14, "CALLS_NAME_COLUMN_INDEX":I
    const/16 v16, 0x2

    .line 300
    .local v16, "CALLS_NUMBER_PRESENTATION_COLUMN_INDEX":I
    const/4 v13, 0x3

    .line 302
    .local v13, "CALLS_ID_COLUMN_INDEX":I
    const/16 v18, 0x0

    .line 303
    .local v18, "callCursor":Landroid/database/Cursor;
    const/16 v17, 0x0

    .line 304
    .local v17, "allCallsCursor":Landroid/database/Cursor;
    new-instance v22, Landroid/util/SparseArray;

    invoke-direct/range {v22 .. v22}, Landroid/util/SparseArray;-><init>()V

    .line 305
    .local v22, "list":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 307
    .local v19, "callIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    const/4 v7, 0x0

    const-string v8, "_id DESC"

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v18

    .line 309
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mResolver:Landroid/content/ContentResolver;

    const/4 v11, 0x0

    const-string v12, "_id DESC"

    move-object v8, v4

    move-object v9, v5

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v17

    .line 311
    if-eqz v17, :cond_4

    .line 312
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_2
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v3

    if-nez v3, :cond_4

    .line 314
    const/4 v3, 0x3

    move-object/from16 v0, v17

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 312
    invoke-interface/range {v17 .. v17}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 335
    :catch_0
    move-exception v20

    .line 336
    .local v20, "e":Landroid/database/CursorWindowAllocationException;
    :try_start_1
    const-string v3, "BluetoothPbapVcardManager"

    const-string v7, "CursorWindowAllocationException while loading CallHistory"

    invoke-static {v3, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 338
    if-eqz v18, :cond_1

    .line 339
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 340
    const/16 v18, 0x0

    .line 343
    .end local v20    # "e":Landroid/database/CursorWindowAllocationException;
    :cond_1
    :goto_3
    return-object v22

    .line 285
    .end local v5    # "projection":[Ljava/lang/String;
    .end local v13    # "CALLS_ID_COLUMN_INDEX":I
    .end local v14    # "CALLS_NAME_COLUMN_INDEX":I
    .end local v15    # "CALLS_NUMBER_COLUMN_INDEX":I
    .end local v16    # "CALLS_NUMBER_PRESENTATION_COLUMN_INDEX":I
    .end local v17    # "allCallsCursor":Landroid/database/Cursor;
    .end local v18    # "callCursor":Landroid/database/Cursor;
    .end local v19    # "callIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .end local v22    # "list":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    :cond_2
    new-instance v6, Ljava/lang/String;

    .end local v6    # "selection":Ljava/lang/String;
    invoke-direct {v6}, Ljava/lang/String;-><init>()V

    .restart local v6    # "selection":Ljava/lang/String;
    goto/16 :goto_0

    .line 290
    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "number LIKE \'%"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v7, "%\'"

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 317
    .restart local v5    # "projection":[Ljava/lang/String;
    .restart local v13    # "CALLS_ID_COLUMN_INDEX":I
    .restart local v14    # "CALLS_NAME_COLUMN_INDEX":I
    .restart local v15    # "CALLS_NUMBER_COLUMN_INDEX":I
    .restart local v16    # "CALLS_NUMBER_PRESENTATION_COLUMN_INDEX":I
    .restart local v17    # "allCallsCursor":Landroid/database/Cursor;
    .restart local v18    # "callCursor":Landroid/database/Cursor;
    .restart local v19    # "callIdList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    .restart local v22    # "list":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    :cond_4
    if-eqz v18, :cond_8

    .line 318
    :try_start_2
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_4
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v3

    if-nez v3, :cond_8

    .line 320
    const/4 v3, 0x1

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v23

    .line 321
    .local v23, "name":Ljava/lang/String;
    invoke-static/range {v23 .. v23}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 323
    const/4 v3, 0x2

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v24

    .line 325
    .local v24, "numberPresentation":I
    const/4 v3, 0x1

    move/from16 v0, v24

    if-eq v0, v3, :cond_7

    .line 326
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mContext:Landroid/content/Context;

    const v7, 0x7f05000e

    invoke-virtual {v3, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v23

    .line 331
    .end local v24    # "numberPresentation":I
    :cond_5
    :goto_5
    const/4 v3, 0x3

    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    add-int/lit8 v21, v3, 0x1

    .line 332
    .local v21, "index":I
    move-object/from16 v0, v22

    move/from16 v1, v21

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 319
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_4

    .line 338
    .end local v21    # "index":I
    .end local v23    # "name":Ljava/lang/String;
    :catchall_0
    move-exception v3

    if-eqz v18, :cond_6

    .line 339
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 340
    const/16 v18, 0x0

    :cond_6
    throw v3

    .line 328
    .restart local v23    # "name":Ljava/lang/String;
    .restart local v24    # "numberPresentation":I
    :cond_7
    const/4 v3, 0x0

    :try_start_3
    move-object/from16 v0, v18

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_3
    .catch Landroid/database/CursorWindowAllocationException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v23

    goto :goto_5

    .line 338
    .end local v23    # "name":Ljava/lang/String;
    .end local v24    # "numberPresentation":I
    :cond_8
    if-eqz v18, :cond_1

    .line 339
    invoke-interface/range {v18 .. v18}, Landroid/database/Cursor;->close()V

    .line 340
    const/16 v18, 0x0

    goto/16 :goto_3
.end method

.method public setIOTSolution(Z)V
    .locals 0
    .param p1, "enabled"    # Z

    .prologue
    .line 131
    iput-boolean p1, p0, Lcom/android/bluetooth/pbap/BluetoothPbapVcardManager;->mIOTSolutionOn:Z

    .line 132
    return-void
.end method