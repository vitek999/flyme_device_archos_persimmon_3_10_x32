.class final Landroid/widget/ProgressBar$SavedState$1;
.super Ljava/lang/Object;
.source "ProgressBar.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/widget/ProgressBar$SavedState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Landroid/widget/ProgressBar$SavedState;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1776
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/widget/ProgressBar$SavedState;
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 1778
    new-instance v0, Landroid/widget/ProgressBar$SavedState;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Landroid/widget/ProgressBar$SavedState;-><init>(Landroid/os/Parcel;Landroid/widget/ProgressBar$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 1776
    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar$SavedState$1;->createFromParcel(Landroid/os/Parcel;)Landroid/widget/ProgressBar$SavedState;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Landroid/widget/ProgressBar$SavedState;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 1782
    new-array v0, p1, [Landroid/widget/ProgressBar$SavedState;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 1776
    invoke-virtual {p0, p1}, Landroid/widget/ProgressBar$SavedState$1;->newArray(I)[Landroid/widget/ProgressBar$SavedState;

    move-result-object v0

    return-object v0
.end method
