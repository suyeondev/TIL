# 데이터 분석 프로젝트 

## 주제 : 코로나 19로 인한 관광,여행 산업의 변화 분석



### 목표 : 전국 주요관광지점 입장객 통계를 분석하여 코로나 19가 국내 관광지점 운영에 미친 영향 확인해보기.



#### 3. 데이터 분석

```R
# 3 - 3 내국인 관광객과 외국인 관광객의 비교

# 코로나 전후 내국인 관광객과 외국인 관광객 증감추이( 전국 )

library(dplyr)
library(ggplot2)

local_foreigner <-korea_data %>%
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
  filter(`내/외국인` != "합계")
local_foreigner <- t(local_foreigner)
local_foreigner <- as.data.frame(local_foreigner)
local_foreigner <- rename(local_foreigner, 내국인 = V1)
local_foreigner <- rename(local_foreigner, 외국인 = V2)
local_foreigner <- local_foreigner[2:25,]
local_foreigner <- rownames_to_column(local_foreigner, var='기간')



local_foreigner <- local_foreigner %>% 
  mutate(연도 = ifelse(substr(기간, 1,4)== "2019", 2019,2020),
           월 = substr(기간, 6,7))

# 분석에 용이하게 범주형으로 변환
local_foreigner$연도 <- as.factor(local_foreigner$연도)
local_foreigner$월 <- as.factor(local_foreigner$월)
local_foreigner$내국인 <- as.numeric(local_foreigner$내국인 )
local_foreigner$외국인 <- as.numeric(local_foreigner$외국인 )

# 코로나 전후 내국인 입장객 증감 추세(전국)
ggplot (local_foreigner, aes(x = 월, group = 연도,  color = 연도) )+
  geom_line(aes(y=내국인), size = 2)+
  ggtitle("코로나 전후 내국인 입장객 증감 추세")+
  geom_point(aes(y=내국인),size = 4)+
  ylab("내국인입장객 누적합계")+
  scale_x_discrete(limits = c("1","2","3","4","5","6","7","8","9","10","11","12" ))+
  theme(legend.text = element_text(size =15, face = "bold"),
        legend.title = element_text(size =16, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 25))
```



![7 코로나 전후 내국인 입장객 증감 추세](https://user-images.githubusercontent.com/86271820/135999254-e8d520a6-20a7-4491-b937-8928ba2d4970.jpg)

해석 : 코로나가 심해진 2020년 2월부터 급격하게 감소 & 2019년 대비 크게 감소한 모습 확인이 가능하다. 



```R
# 코로나 전후 외국인 입장객 증감 추세 (전국)
ggplot(local_foreigner, aes(x = 월, group = 연도, color = 연도) ) +
  geom_line(aes(y = 외국인),size = 2) +
  ggtitle("코로나 전후 외국인 입장객 증감 추세")+
  geom_point(aes(y=외국인),size = 4)+
  scale_x_discrete(limits = c("1","2","3","4","5","6","7","8","9","10","11","12" ))+
  ylab("외국인입장객 누적합계")+
  theme(legend.text = element_text(size =15, face = "bold"),
        legend.title = element_text(size =16, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 25))
```



![8 코로나 전후 외국인 입장객 증감 추세](https://user-images.githubusercontent.com/86271820/135999356-81d064c0-98b8-4291-aa36-6f270f971222.jpg)

해석 : 코로나가 심해진 2020년 2월부터 급격하게 감소 & 2019년 대비 크게 감소한 모습 확인이 가능하다. 특히 2020년 3월 이후부터 눈에띄게 줄어들어 코로나가 나아지지 않아 이러한 추이가 계속 되고 있는 것으로 추측된다.



```R
# 코로나 전후 내국인 관광객과 외국인 관광객 증감률 확인( 지역별 )

local_foreigner_area <- korea_data %>%
  group_by(시도,`내/외국인`) %>%
  summarise('2019누적합계' = sum(인원합계_2019,na.rm =T),
            '2020누적합계' = sum(인원합계_2020,na.rm =T))%>%
  filter(`내/외국인` != "합계")

# 내국인 부분만 추출.
local_area <- local_foreigner_area %>% 
  filter(`내/외국인` == "내국인")
# 외국인 부분만 추출
foreigner_area <-  local_foreigner_area %>% 
  filter(`내/외국인` == "외국인") 

# 각 데이터프레임에 증감률 파생변수 생성.
local_area <- as.data.frame(local_area)
foreigner_area<- as.data.frame(foreigner_area)

local_area<-local_area %>%
  mutate(`증감률` =  round((`2020누적합계`-`2019누적합계`)/`2019누적합계`*100,1))

foreigner_area<-foreigner_area%>%
  mutate(`증감률` =  round((`2020누적합계`-`2019누적합계`)/`2019누적합계`*100,1))


# 코로나 전후 지역별 내국인 입장객 증감률 
ggplot(local_area, aes(x=시도, y = `증감률`, fill= 시도))+
  geom_bar(stat = "identity")+
  ggtitle("코로나 전후 지역별 내국인 입장객 증감률",subtitle ="내국인 입장객이 가장 증가/감소한 지역은 어느 곳인가?")+
  geom_text(aes(y=`증감률`,label=`증감률`), 
            position = position_dodge(width=1),
            vjust=1,
            size = 5)+
  theme(legend.text = element_text(size =15, face = "bold"),
        legend.title = element_text(size =16, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 25),
        plot.subtitle = element_text(face = "bold", hjust = 0.5, size = 20))
```



![9 코로나 전후 지역별 내국인 입장객 증감률](https://user-images.githubusercontent.com/86271820/135999436-f784f32a-7e8e-49d7-b40d-a0379bee067b.jpg)

 **[증감률=(2020누적합계-2019누적합계)/2019누적합계 * 100 ]**

해석: 전국 모든 지역에서 감소하여 증감률이 음수값인 것을 확인할 수 있고, 감소율이 가장 큰 곳은 부산, 감소율이 가장 작은 곳은 대전이다.





```R
# 코로나 전후 지역별 외국인 관광객 증감률

ggplot(foreigner_area, aes(x=시도, y = `증감률`, fill= 시도))+
  geom_bar(stat = "identity")+
  ggtitle("코로나 전후 지역별 외국인 입장객 증감률", subtitle ="외국인 입장객이 가장 증가/감소한 지역은 어느 곳인가?" )+
  geom_text(aes(y=`증감률`,label=`증감률`), 
            position = position_dodge(width=1),
            vjust=1,
            size = 5)+
  theme(legend.text = element_text(size =15, face = "bold"),
        legend.title = element_text(size =16, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 25),
        plot.subtitle = element_text(face = "bold", hjust = 0.5, size = 20))

```



![10 코로나 전후 지역별 외국인 입장객 증감률](https://user-images.githubusercontent.com/86271820/135999441-c5fe01af-8bc2-4c62-a665-7cf41124e7ce.jpg)

해석 : 세종시를 제외한 모든 지역에서 감소해서 음수값이다. 감소율이 가장 큰 곳은 인천, 가장 작은 곳은 전라남도이다. 세종시의 경우 외국인 입장객 총량이 24명에서 51명으로 증가했지만 수치가 너무 작아서 유의미한 결과로 해석하기엔 무리가 있어 보인다.



```R
# 내국인 관광객에게 인기있는 관광지 상위 5위(2020)

local_tourist_area_top5_2020<- as.data.frame(korea_data %>%
                                               group_by(관광지명) %>%
                                               filter(`내/외국인` == "내국인") %>%
                                               select(관광지명, `내/외국인`, 인원합계_2020) %>%
                                               arrange(desc(`인원합계_2020`))%>%
                                               head(5))

# 비율값 파생변수 생성
local_tourist_area_top5_2020<-local_tourist_area_top5_2020 %>%
  mutate(비율 = round((인원합계_2020/sum(인원합계_2020))*100,1))

# 내국인 입장객에게 인기있는 관광지 Top 5 (2020) 시각화
ggplot(local_tourist_area_top5_2020, aes(x="", y = `인원합계_2020`, fill = 관광지명))+
  geom_bar(width=1, stat = "identity")+
  coord_polar("y",start = 0)+
  geom_text(aes(y=`인원합계_2020`,label=paste(관광지명,"\n",`비율`,"% (",`인원합계_2020`,")")), 
            position = position_stack(vjust = 0.4),
            size =7)+
  ggtitle("내국인 입장객에게 인기있는 관광지 Top 5 (2020)")+
  theme(legend.text = element_text(size =25, face = "bold"),
        legend.title = element_text(size =27, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 30))

```



![11 내국인 입장객에게 인기있는 관광지 Top5 (2020)](https://user-images.githubusercontent.com/86271820/135999450-094a3c02-c9ec-45e7-9df0-a9b23c7e7900.jpg)

해석 : 자연환경이 주가 되는 관광지를 선호한 것으로 예상된다.

```R
# 외국인 관광객에게 인기있는 관광지 상위 5위(2020)

foreigner_tourist_area_top5_2020<- as.data.frame(korea_data %>%
                                                   group_by(관광지명) %>%
                                                   filter(`내/외국인` == "외국인") %>%
                                                   select(관광지명, `내/외국인`, 인원합계_2020) %>%
                                                   arrange(desc(`인원합계_2020`))%>%
                                                   head(5))

# 비율값 파생변수 생성
foreigner_tourist_area_top5_2020<-foreigner_tourist_area_top5_2020%>%
  mutate(비율 = round((인원합계_2020/sum(인원합계_2020))*100,1))



# 외국인 입장객에게 인기있는 관광지 Top 5 (2020) 시각화

ggplot(foreigner_tourist_area_top5_2020, aes(x="", y = `인원합계_2020`, fill = 관광지명))+
  geom_bar(width=1, stat = "identity")+
  coord_polar("y",start = 0)+
  geom_text(aes(y=`인원합계_2020`,label=paste(관광지명,"\n",`비율`,"% (",`인원합계_2020`,")")), 
            position = position_stack(vjust = 0.5),
            size = 7)+
  ggtitle("외국인 입장객에게 인기있는 관광지 Top 5 (2020)")+
  theme(legend.text = element_text(size =25, face = "bold"),
        legend.title = element_text(size =27, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 30))
```



![12 외국인 입장객에게 인기있는 관광지 Top5(2020)](https://user-images.githubusercontent.com/86271820/135999452-7ed6c4f4-03f1-4924-989f-3e41132eda4d.jpg)

해석 : 비교적 한국의 문화를 경험해볼 수 있는 관광지를 선호한 것으로 예상된다.

