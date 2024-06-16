bool booleans() {
  var isOn = true; // this is a variable - something that will change
  print('isOn = ${isOn}');

  bool isOff = false; // this is a variable - something that will change
  print('isOn = ${isOff}');
  
  print('isOn is a ${isOn.runtimeType}');

  return true;
}

// ${} = untuk nge run code di dalamnya
// var = generic object, meskipun dideklarasikan sebagai var, dart sudah mengetahui secara otomatis bahwa isOn adalah boolean