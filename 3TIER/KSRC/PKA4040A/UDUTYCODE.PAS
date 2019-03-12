unit UDutycode;

interface

const
  NORMAL    = '00'; // 정상
  HOLIDAY   = '49'; // 휴일
  HOLIDAY2  = '50'; // 휴근
  HOLISATUR = '05'; // 토요휴무
  HOLIHALF  = '61'; // 반차
  HOLIMOHTH = '62'; // 월차
  HOLIYEAR  = '63'; // 연차
  YEARHALF  = '64'; // 반연차 2010.06.28
  HOLISICK  = '71'; // 병가
  ABSENCE   = '72'; // 결근
  ILLNESS   = '82'; // 병상
  BABYCARE  = '83'; // 육아
  MILITARY  = '84'; // 병역
  INDICTMEN = '85'; // 기소
  ABROAD    = '86'; // 유학
  POPULAR   = '87'; // 일반
  OTHERS    = '89'; // 기타
  UNDECIDED = '99'; // 미입력
  PUBREST   = '81'; // 공상
  BEAR      = '55'; // 산휴
  EXCHANGE  = '06'; // 교대근무         DSA2000 2005.07.
  EXCHHOLI  = '07'; // 교대근무자 비번  DSA2000 2005.07.
  SPEOFF    = '04'; // 교휴             DSA2000 2005.07.
  WORKSTOP  = '91'; // 정직
  BEFORE    = '97'; // 불입
  TEMPORARY = '98'; // 임시
  SPECIAL   = '51'; // 특휴 2016.09.23.hjku.. 추가  
  LONGWORK  = '52'; // 장휴
  PUBVAR    = '53'; // 공가
  PUBSICK   = '54'; // 공병

implementation

end.
