; ModuleID = '<stdin>'
source_filename = "./assign_c/gen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ModPlugFile = type { i8* }

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @ModPlug_InstrumentName(%struct.ModPlugFile* noundef %file, i32 noundef %qual, i8* noundef %buff) #0 {
entry:
  %tobool = icmp ne %struct.ModPlugFile* %file, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  br label %return

if.end:                                           ; preds = %entry
  %mod = getelementptr inbounds %struct.ModPlugFile, %struct.ModPlugFile* %file, i32 0, i32 0
  %0 = load i8*, i8** %mod, align 8
  %sub = sub i32 %qual, 1
  %call = call i8* @openmpt_module_get_instrument_name(i8* noundef %0, i32 noundef %sub)
  %tobool2 = icmp ne i8* %call, null
  br i1 %tobool2, label %if.end7, label %if.then3

if.then3:                                         ; preds = %if.end
  %tobool4 = icmp ne i8* %buff, null
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.then3
  store i8 0, i8* %buff, align 1
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.then3
  br label %return

if.end7:                                          ; preds = %if.end
  %call8 = call i64 @strlen(i8* noundef %call) #4
  %cmp = icmp uge i64 %call8, 2147483647
  br i1 %cmp, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end7
  br label %if.end10

if.end10:                                         ; preds = %if.then9, %if.end7
  %tmpretval.0 = phi i64 [ 2147483646, %if.then9 ], [ %call8, %if.end7 ]
  %conv = trunc i64 %tmpretval.0 to i32
  %tobool11 = icmp ne i8* %buff, null
  br i1 %tobool11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %if.end10
  %add = add i32 %conv, 1
  %conv13 = zext i32 %add to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %buff, i8* align 1 %call, i64 %conv13, i1 false)
  %idxprom = zext i32 %conv to i64
  %arrayidx = getelementptr inbounds i8, i8* %buff, i64 %idxprom
  store i8 0, i8* %arrayidx, align 1
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.end10
  call void @openmpt_free_string(i8* noundef %call)
  br label %return

return:                                           ; preds = %if.end14, %if.end6, %if.then
  %retval.0 = phi i32 [ %conv, %if.end14 ], [ 0, %if.end6 ], [ 0, %if.then ]
  ret i32 %retval.0
}

declare dso_local i8* @openmpt_module_get_instrument_name(i8* noundef, i32 noundef) #1

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8* noundef) #2

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @openmpt_free_string(i8* noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn }
attributes #4 = { nounwind readonly willreturn }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)"}
