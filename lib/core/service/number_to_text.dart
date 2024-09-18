

class ConvertService{
   Map<int, String> numbersMap = {
    0: 'ноль',
    1: 'бир',
    2: 'икки',
    3: 'уч',
    4: 'тўрт',
    5: 'беш',
    6: 'олти',
    7: 'етти',
    8: 'саккиз',
    9: 'тўққиз',
    10: 'ўн',
    11: 'ўн бир',
    12: 'ўн икки',
    13: 'ўн уч',
    14: 'ўн тўрт',
    15: 'ўн беш',
    16: 'ўн олти',
    17: 'ўн етти',
    18: 'ўн саккиз',
    19: 'ўн тўққиз',
    20: 'йигирма',
    30: 'ўттиз',
    40: 'қирқ',
    50: 'эллик',
    60: 'олтмиш',
    70: 'етмиш',
    80: 'саксон',
    90: 'тўқсон',
    100: 'юз',
    1000: 'минг',
    1000000: 'миллион'
  };
   String toWords(int number) {
     if (number == 0) {
       return numbersMap[0]!;
     }

     String result = '';

     if (number >= 1000000) {
       result += '${toWords(number ~/ 1000000)} ${numbersMap[1000000]} ';
       number %= 1000000;
     }

     if (number >= 1000) {
       result += '${toWords(number ~/ 1000)} ${numbersMap[1000]} ';
       number %= 1000;
     }

     if (number >= 100) {
       result += '${toWords(number ~/ 100)} ${numbersMap[100]} ';
       number %= 100;
     }

     if (number >= 20) {
       result += '${numbersMap[(number ~/ 10) * 10]} ';
       number %= 10;
     }

     if (number > 0) {
       result += numbersMap[number]!;
     }

     return result.trim();
   }
}