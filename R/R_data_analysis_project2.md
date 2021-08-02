# 데이터 분석 프로젝트 

## 주제 : 코로나 19로 인한 관광,여행 산업의 변화 분석



### 목표 : 전국 주요관광지점 입장객 통계를 분석하여 코로나 19가 국내 관광지점 운영에 미친 영향 확인해보기.



#### 2 -1. 데이터 불러오기

```R
# 1. 데이터 불러오기 (각 도, 광역시별로 raw데이터 불러오기)

var_name <-  c("시도","군구","관광지명","내/외국인","총계(2019.01 ~ 2020.12)","2019년 인원계","2019.01","2019.02","2019.03","2019.04","2019.05","2019.06","2019.07","2019.08","2019.09","2019.10","2019.11","2019.12","2020년 인원계","2020.01","2020.02","2020.03","2020.04","2020.05","2020.06","2020.07","2020.08","2020.09","2020.10","2020.11","2020.12")
gangwondo_data <- as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_강원도_(2019.01-2020.12).xls"),
                                          col_names = var_name,
                                          skip = 2))
gyeonggido_data <- as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_경기도_(2019.01-2020.12).xls"),
                                          col_names = var_name,
                                          skip = 2))
gyeongsangnamdo_data <- as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_경상남도_(2019.01-2020.12).xls"),
                                                col_names = var_name,
                                                skip = 2))
gyeongsangbugdo_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_경상북도_(2019.01-2020.12).xls"),
                                                col_names = var_name,
                                                skip = 2))
gwangju_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_광주광역시_(2019.01-2020.12).xls"),
                                        col_names =var_name,
                                        skip = 2))
daegu_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_대구광역시_(2019.01-2020.12).xls"),
                                      col_names = var_name,
                                      skip = 2))
daejeon_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_대전광역시_(2019.01-2020.12).xls"),
                                        col_names = var_name,
                                        skip = 2))
busan_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_부산광역시_(2019.01-2020.12).xls"),
                                      col_names =var_name,
                                      skip = 2))
seoul_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_서울특별시_(2019.01-2020.12).xls"),
                                      col_names = var_name,
                                      skip = 2))
sejong_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_세종특별자치시_(2019.01-2020.12).xls"),
                                       col_names = var_name,
                                       skip = 2))
ulsan_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_울산광역시_(2019.01-2020.12).xls"),
                                      col_names = var_name,
                                      skip = 2))
incheon_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_인천광역시_(2019.01-2020.12).xls"),
                                        col_names = var_name,
                                        skip = 2))
jeonlanamdo_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_전라남도_(2019.01-2020.12).xls"),
                                            col_names = var_name,
                                            skip = 2))
jeonlabugdo_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_전라북도_(2019.01-2020.12).xls"),
                                           col_names = var_name,
                                           skip = 2))
jejudo_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_제주특별자치도_(2019.01-2020.12).xls"),
                                      col_names = var_name,
                                      skip = 2))
chungcheongnamdo_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_충청남도_(2019.01-2020.12).xls"),
                                                col_names = var_name,
                                                skip = 2))
chungcheongbugdo_data <-as.data.frame(read_excel(("C:/R_STUDY/data/주요관광지점입장객_충청북도_(2019.01-2020.12).xls"),
                                                 col_names =var_name,
                                                 skip = 2))

```



#### 2-2.  데이터 전처리

```R
# 2. 데이터 전처리

# 2-1. 데이터 결합하기

library(dplyr)

korea_data <- bind_rows(gangwondo_data,
                        gyeonggido_data,
                        gyeongsangnamdo_data,
                        gyeongsangbugdo_data,
                        gwangju_data,
                        daegu_data,
                        daejeon_data,
                        busan_data,
                        seoul_data,
                        sejong_data,
                        ulsan_data,
                        incheon_data,
                        jeonlanamdo_data,
                        jeonlabugdo_data,
                        jejudo_data,
                        chungcheongnamdo_data,
                        chungcheongbugdo_data)
korea_data1 <- korea_data
korea_data2 <- korea_data
View(korea_data)
dim(korea_data)
str(korea_data)

# 2-2 결측값 유무 확인 및 처리.

table(is.na(korea_data)) # 총 201686값 중 8758개의 na값 존재.

# 입장객 수의 통계자료이므로 결측값은 관광지점 휴업상태/ 개업전 상태/ 폐업후 상태 중 하나라고 해석할 수 있다. 

# (2019년엔 na값이었다가 2020년에 수치값이 있다면, 2020년부터 운영을 시작한 것.)

# 따라서, 유의미한 결측값으로 보고 삭제나, 다른 값으로 대체하지 않는다.

View(korea_data)

# 2-3 데이터 형 변환. (범주형으로 변환)

korea_data$시도 <- as.factor(korea_data$시도)
korea_data$군구 <- as.factor(korea_data$군구)
korea_data$관광지명 <- as.factor(korea_data$관광지명)
korea_data$"내/외국인" <- as.factor(korea_data$"내/외국인")
str(korea_data)


# 2-4 파생변수 만들기

# 시도별 2019 입장객 평균

korea_data <- as.data.frame(korea_data %>%
                              group_by(시도) %>%
                                mutate(mean_2019 = mean(`2019년 인원계`,na.rm =T)))

# 시도별 2020 입장객 평균

korea_data <- as.data.frame(korea_data %>%
                              group_by(시도) %>%
                                mutate(mean_2020 = mean(`2020년 인원계`,na.rm =T)))

str(korea_data)

# 2-5 변수명 변경하기

korea_data <- rename(korea_data, 누적합계평균값_2019 = mean_2019)
korea_data <- rename(korea_data, 누적합계평균값_2020 = mean_2020)
korea_data <- rename(korea_data, 인원합계_2019 = `2019년 인원계`)
korea_data <- rename(korea_data, 인원합계_2020 = `2020년 인원계`)


```



