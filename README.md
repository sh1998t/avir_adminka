# nasiya_savdo
Flutter version
3.22.2
Dart version
3.4.3


nasiya_savdo mobile

## Getting Started



## Coding conventions

1. Auto format should be applied in every file
   Mac: Cmd + option + L
2. Importing with only package: prefix (e.g: package:boss_tracker_child/utils/app_constants.dart)
   no root (../../ ) imports are allowed, it will confuse usage of files, and organization
3. If you are changing the core logic, or need to update smth when they are ready, add TODO
   Example : **TODO (Azamat): Backend now only returns accessToken when, refreshed,**
4. Every response should be mapped using extension mapper into domain Entity. UserResponse to UserEntity
5. Always put comma at the end of multi argumented functions and constructors.
```
dart run build_runner build --delete-conflicting-outputs
dart run build_runner watch --delete-conflicting-outputs

or 
flutter packages pub run build_runner build --delete-conflicting-outputs

To resolve the Redeclaration error - the cached version may 
create a conflict with the current version

flutter clean && flutter packages get

```



