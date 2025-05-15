import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
  // 1. 유저에게 무엇을 낼건지 물어보는
  print('가위, 바위, 보 중 하나를 입력해 주세요');

  final String? userInput = stdin.readLineSync(encoding: utf8);

  // 2. 컴퓨터 랜덤 추출
  const comList = ['가위','바위','보'];
  final comResult = comList[Random().nextInt(3)];

  final result = getResult(userInput!, comResult);
  print('사용자는 $userInput을 냈습니다');
  print('컴퓨터는 $comResult을 냈습니다');
  print('결과는 $result');
}

getResult(String userInput, String comInput) {
  const comWin = '컴퓨터가 승리 하였습니다';
  const userWin = '사용자가 승리 하였습니다';
  const draw = '비겼습니다';
  String result = draw;

  switch(userInput) {
    case '가위' :
      if(comInput == '바위') {
        result = comWin;
      }
      if(comInput == '보') {
        result = userWin;
      }
    case '바위' :
      if(comInput == '보') {
        result = comWin;
      }
      if(comInput == '가위') {
        result = userWin;
      }
    case '보' :
      if(comInput == '가위') {
        result = comWin;
      }
      if(comInput == '주먹') {
        result = userWin;
      }
    default:
      result = '값이 정확하지 않습니다';
  }
  return result;
}