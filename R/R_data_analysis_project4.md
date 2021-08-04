# 데이터 분석 프로젝트 

## 주제 : 코로나 19로 인한 관광,여행 산업의 변화 분석



### 목표 : 전국 주요관광지점 입장객 통계를 분석하여 코로나 19가 국내 관광지점 운영에 미친 영향 확인해보기.



#### 3. 데이터 분석

```R
# 3 - 2 코로나 전후 전국, 지역별 입장객 비교.

# 코로나 전후 전국의 입장객 누적 합계 비교

# 2019 입장객 누적 총계 vs 2020 입장객 누적 총계
visitor_data<-korea_data %>%
                group_by(`내/외국인`) %>%
                  summarise('2019년 입장객 누적 합계' = sum(인원합계_2019, na.rm =T),
                            '2020년 입장객 누적 합계' = sum(인원합계_2020, na.rm =T)) %>%
                    filter(`내/외국인` == '합계')

# 시각화를 위해 데이터 행과 열 전환 및 가공.
visitor_data<- t(visitor_data)
visitor_data<-as.data.frame(visitor_data[2:3,])
str(visitor_data)
visitor_data<-rename(visitor_data,"누적합계" = "visitor_data[2:3, ]")
visitor_data$year <- c(2019,2020)
visitor_data$누적합계<- as.numeric(visitor_data$누적합계)
visitor_data$year <- as.factor(visitor_data$year)

bar_korea_count<-barplot(status_table$open, 
                         main ="주요 관광지점 입장객 통계 조사지점 수 (단위 : 개소)",
                         names= c("2019년","2020년"),
                         col =c("sky blue","yellow"),
                         xlab="연도",
                         ylab = "전국 조사지점 수",
                         ylim = c(0,3000),
                         border="white")


ggplot(visitor_data,aes(x = year, y=누적합계, fill = year))+
  geom_bar(stat= "identity",width = 0.8)+
  geom_text(aes(y=누적합계,label=누적합계), 
            position = position_stack(vjust=0.5),
            size = 5)+
  ggtitle("전국 입장객 누적 합계 비교")+
  ylim(c(0,500000000))

str(visitor_data)
str(korea_data)  
# 2019-2020년 월별 입장객 누적 합계 증감 추이

visitor_month_data<-as.data.frame(korea_data %>%
                          group_by(`내/외국인`) %>%
                              summarise('2019.1' = sum(`2019.01`,na.rm = T),
                                        '2019.2' = sum(`2019.02`,na.rm = T),
                                        '2019.3' = sum(`2019.03`,na.rm = T),
                                        '2019.4' = sum(`2019.04`,na.rm = T),
                                        '2019.5' = sum(`2019.05`,na.rm = T),
                                        '2019.6' = sum(`2019.06`,na.rm = T),
                                        '2019.7' = sum(`2019.07`,na.rm = T),
                                        '2019.8' = sum(`2019.08`,na.rm = T),
                                        '2019.9' = sum(`2019.09`,na.rm = T),
                                        '2019.10' = sum(`2019.10`,na.rm = T),
                                        '2019.11' = sum(`2019.11`,na.rm = T),
                                        '2019.12' = sum(`2019.12`,na.rm = T),
                                        '2020.1' = sum(`2020.01`,na.rm = T),
                                        '2020.2' = sum(`2020.02`,na.rm = T),
                                        '2020.3' = sum(`2020.03`,na.rm = T),
                                        '2020.4' = sum(`2020.04`,na.rm = T),
                                        '2020.5' = sum(`2020.05`,na.rm = T),
                                        '2020.6' = sum(`2020.06`,na.rm = T),
                                        '2020.7' = sum(`2020.07`,na.rm = T),
                                        '2020.8' = sum(`2020.08`,na.rm = T),
                                        '2020.9' = sum(`2020.09`,na.rm = T),
                                        '2020.10' = sum(`2020.10`,na.rm = T),
                                        '2020.11' = sum(`2020.11`,na.rm = T),
                                        '2020.12' = sum(`2020.12`,na.rm = T)) %>%
                                   filter(`내/외국인` == '합계'))

str(visitor_month_data)
head(visitor_month_data)
# 시각화하기 좋게 행과 열 가공
visitor_month_data <- t(visitor_month_data)
visitor_month_data <- as.data.frame(visitor_month_data[2:25, ])

library(tibble)
visitor_month_data <- rownames_to_column(visitor_month_data, var='기간')

visitor_month_data <- rename(visitor_month_data, "합계" =  "visitor_month_data[2:25, ]" )


visitor_month_data <- visitor_month_data %>%
                         mutate(연도 =ifelse(substr(기간,1,4) == 2019, 2019,2020),
                                  월 = substr(기간,6,7))
visitor_month_data$연도 <- as.factor(visitor_month_data$연도)
visitor_month_data$월 <- as.factor(visitor_month_data$월)
visitor_month_data$합계 <- as.numeric(visitor_month_data$합계)
str(visitor_month_data)
?geom_line


ggplot(visitor_month_data, aes(x = 월, y = 합계, group = 연도, color = 연도))+
  geom_line(size =2)+
  theme_bw()+
  scale_x_discrete(limits = c("1","2","3","4","5","6","7","8","9","10","11","12" ))+
  ggtitle("2019-2020 월별 입장객 누적합계")+
  ylim(c(0,60000000))
  



# 지역별 입장객 누적 합계 평균값 비교.
area_count_sum <- korea_data %>%
                    group_by(시도,`내/외국인`) %>%
                      summarise("2019년 합계 평균값" = round(mean(인원합계_2019,na.rm=T),1),
                                "2020년 합계 평균값" = round(mean(인원합계_2020,na.rm =T),1)) %>%
                        filter(`내/외국인` == '합계')
area_count_sum <- as.data.frame(area_count_sum[,c(1,3,4)])

area_count_sum$`2019년 합계 평균값` <-as.numeric(area_count_sum$`2019년 합계 평균값`) 
area_count_sum$`2020년 합계 평균값` <-as.numeric(area_count_sum$`2020년 합계 평균값`) 

area_ex <- area_count_sum
library(reshape2)
area_ex <- melt(area_ex,id.vars = "시도", measure.vars = c("2019년 합계 평균값","2020년 합계 평균값"))
str(area_count_sum)
area_ex<-area_ex %>%
  mutate(year = ifelse(substr(variable,1,4)=="2019",2019,2020))
area_ex$year <- as.factor(area_ex$year)

area_ex <- rename(area_ex,누적합계평균값 = value)


# 어느지역이 가장 관광객 많고 적은지?
ggplot(area_ex, aes(x=시도, y = 누적합계평균값, fill= year))+
  geom_bar(stat = "identity")+
  ggtitle("지역별 입장객 누적합계 평균값 비교")+
  geom_text(aes(y=누적합계평균값,label=누적합계평균값), 
            position = position_stack(vjust=0.5),
            size = 4)
    


# 지역별 증감폭 시각화 2019평균값 - 2020 평균값 해서 파생변수 만들어서 막대/꺾은선 그래프.
# 평균값 차이 가장 큰곳 = 타격 큰곳.
# 평균값 차이 가장 작은 곳 = 타격 작은 곳.


ggplot(area_count_sum, aes(x=시도, y = (`2019년 합계 평균값` - `2020년 합계 평균값`) ,fill = 시도))+
  geom_bar(stat = "identity")+
  ggtitle("지역별 입장객 평균값 차이비교")+
  geom_text(aes(y=(`2019년 합계 평균값` - `2020년 합계 평균값`),label=(`2019년 합계 평균값` - `2020년 합계 평균값`)), 
            position = position_dodge(width=1),
            vjust=-0.5,
            size = 4)



```

