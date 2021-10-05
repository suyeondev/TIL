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
library(ggplot2)

# 전국 관광지점 입장객 누적 합계 비교 시각화
ggplot(visitor_data,aes(x = year, y=누적합계, fill = year))+
  geom_bar(stat= "identity",width = 0.8)+
  geom_text(aes(y=누적합계,label=누적합계), 
            position = position_stack(vjust=0.5),
            size = 8)+
  ggtitle("전국 관광지점 입장객 누적 합계 비교(2019 vs 2020)")+
  ylim(c(0,500000000))+
  theme(legend.text = element_text(size =13, face = "bold"),
        legend.title = element_text(size =14, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 20))

```



![3 전국 관광지점 입장객 누적 합계 비교(2019vs2020)](https://user-images.githubusercontent.com/86271820/135998796-c892974b-b435-4a03-81e2-40bba0ea22e7.jpg)

해석 : 전국 입장객 누적합계가 **2020년에 거의** **절반가량으로** **감소**했다.



```R
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

# 코로나 전후 입장객 누적합계 변화를 보여주는 그래프 시각화(월별)
ggplot(visitor_month_data, aes(x = 월, y = 합계, group = 연도, color = 연도))+
  geom_line(size =2)+
  theme_bw()+
  scale_x_discrete(limits = c("1","2","3","4","5","6","7","8","9","10","11","12" ))+
  ggtitle("2019-2020 월별 입장객 누적합계 변화")+
  ylim(c(0,60000000))+
  theme(legend.text = element_text(size =13, face = "bold"),
        legend.title = element_text(size =14, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 20))

```



![4 2019-2020 월별 입장객 누적합계 변화](https://user-images.githubusercontent.com/86271820/135998907-82de2f38-f2d6-4e3f-9897-612f589afbfb.jpg)

해석 : 코로나가 심해지기 전인 1월까지만 해도 2019년과 비슷한 수치를 기록했지만, 그 이후부터는 2019년 대비 현저히 낮은 것을 확인할 수 있다. 



```R
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
str(area_ex)



area_ex <- rename(area_ex,누적합계평균값 = value)


# 어느지역이 가장 관광객 많고 적은지?
ggplot(area_ex, aes(x=시도, y = 누적합계평균값, fill= year))+
  geom_bar(stat = "identity",position = "dodge", )+
  ggtitle("지역별 입장객 누적합계 평균값 비교")+
  geom_text(aes(y=누적합계평균값,label=누적합계평균값), 
            position = position_dodge(width=1),
            vjust=-0.3,
            size = 4.5)+
  theme(legend.text = element_text(size =15, face = "bold"),
        legend.title = element_text(size =16, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 25))

```



![5 지역별 입장객 누적합계 평균값 비교](https://user-images.githubusercontent.com/86271820/135999007-cfc7b6a4-38ae-462f-a33b-0bd0351d3fc1.jpg)

해석 : 지역별 입장객 누적합계의 평균값을 비교해보았을 때, 모든 지역에서 2019년 대비 2020년의 입장객 누적합계의 평균값이 감소하여 전 지역에서 입장객이 줄어든 것을 확인해 볼 수 있었다. 2019년 2020년 모두 관광지 입장객이 가장 많은 곳은 서울이었고, 입장객 적은 곳은 2019년과 2020년 순서의 차이가 있었지만, 두 해 모두 인천, 울산 광주 등이 입장객이 적었다.

```R

area_count_sum <- area_count_sum %>%
                    mutate(`2019합계평균 - 2020합계평균` = `2019년 합계 평균값` - `2020년 합계 평균값`)
str(area_count_sum)

# 지역별 증감폭 시각화 2019평균값 - 2020 평균값 해서 파생변수 만들어서 막대/꺾은선 그래프.
# 평균값 차이 가장 큰곳 = 타격 큰곳.
# 평균값 차이 가장 작은 곳 = 타격 작은 곳.


ggplot(area_count_sum, aes(x=시도, y = `2019합계평균 - 2020합계평균` ,fill = 시도))+
  geom_bar(stat = "identity")+
  ggtitle("코로나 전후 지역별 입장객합계 평균값 차이")+
  geom_text(aes(y=`2019합계평균 - 2020합계평균`,label=`2019합계평균 - 2020합계평균`), 
            position = position_dodge(width=1),
            vjust=-1,
            size = 4)+
  theme(legend.text = element_text(size =15, face = "bold"),
        legend.title = element_text(size =16, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 25))

```



![6 지역별 입장객 2019년 2020년 평균값 차이 비교](https://user-images.githubusercontent.com/86271820/135999159-ba4d759e-8177-4b73-911e-195e84d8a626.jpg)

해석 : 평균값의 차이가 큰 곳을 감소 타격이 큰 곳으로 차이가 작은 곳을 입장객 감소 타격이 적은 곳으로 해석했을 때, 입장객 감소 타격이 가장 큰 곳은 서울, 부산, 제주도 순으로 관광지로 유명한 지역들이 가장 타격이 컸던 것으로 추측된다. 반면, 입장객 감소 타격이 적었던 곳은 세종시, 울산, 충청북도순으로 세종시와 울산시의 경우 코로나 전에도 입장객이 대체로 적은 지역이었기에 감소 타격이 크지 않았던 것으로 추측된다. 

