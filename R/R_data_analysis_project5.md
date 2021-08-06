# 데이터 분석 프로젝트 

## 주제 : 코로나 19로 인한 관광,여행 산업의 변화 분석



### 목표 : 전국 주요관광지점 입장객 통계를 분석하여 코로나 19가 국내 관광지점 운영에 미친 영향 확인해보기.



#### 3. 데이터 분석

```R
# 3 - 3 내국인 관광객과 외국인 관광객의 비교

# 코로나 전후 내국인 관광객과 외국인 관광객 증감추이( 전국 )

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

local_foreigner$연도 <- as.factor(local_foreigner$연도)
local_foreigner$월 <- as.factor(local_foreigner$월)
local_foreigner$내국인 <- as.numeric(local_foreigner$내국인 )
local_foreigner$외국인 <- as.numeric(local_foreigner$외국인 )

str(local_foreigner)
# 코로나 전후 외국인 관광객 증감 추세
ggplot(local_foreigner, aes(x = 월, group = 연도, color = 연도) ) +
  geom_line(aes(y = 외국인),size = 2) +
  ggtitle("코로나 전후 외국인 관광객 증감 추세")+
  geom_point(aes(y=외국인),size = 4)+
  scale_x_discrete(limits = c("1","2","3","4","5","6","7","8","9","10","11","12" ))+
  theme(legend.text = element_text(size =15, face = "bold"),
        legend.title = element_text(size =16, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 25))



# 코로나 전후 내국인 관광객 증감 추세
ggplot (local_foreigner, aes(x = 월, group = 연도, color = 연도) )+
  geom_line(aes(y=내국인), size = 2)+
  ggtitle("코로나 전후 내국인 관광객 증감 추세")+
  geom_point(aes(y=내국인),size = 4)+
  scale_x_discrete(limits = c("1","2","3","4","5","6","7","8","9","10","11","12" ))+
  theme(legend.text = element_text(size =15, face = "bold"),
        legend.title = element_text(size =16, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 25))



str(local_foreigner)
str(korea_data)

# 코로나 전후 내국인 관광객과 외국인 관광객 증감폭 확인( 지역별 )

local_foreigner_area <- korea_data %>%
  group_by(시도,`내/외국인`) %>%
  summarise('2019누적합계' = sum(인원합계_2019,na.rm =T),
            '2020누적합계' = sum(인원합계_2020,na.rm =T))%>%
  filter(`내/외국인` != "합계")

local_area <- local_foreigner_area %>% 
  filter(`내/외국인` == "내국인")

foreigner_area <-  local_foreigner_area %>% 
  filter(`내/외국인` == "외국인") 

local_area <- as.data.frame(local_area)
foreigner_area<- as.data.frame(foreigner_area)
# 코로나 전후 지역별 내국인 관광객 증감폭 
ggplot(local_area, aes(x=시도, y = `2019누적합계`-`2020누적합계`, fill= 시도))+
  geom_bar(stat = "identity")+
  ggtitle("코로나 전후 지역별 내국인 관광객 증감폭",subtitle ="내국인 관광객이 가장 증가/감소한 지역은 어느 곳인가?")+
  geom_text(aes(y=`2019누적합계`-`2020누적합계`,label=`2019누적합계`-`2020누적합계`), 
            position = position_dodge(width=1),
            vjust=-0.5,
            size = 5)+
  theme(legend.text = element_text(size =15, face = "bold"),
        legend.title = element_text(size =16, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 25),
        plot.subtitle = element_text(face = "bold", hjust = 0.5, size = 20))

# 내국인 관광객의 감소폭이 가장 적은 지역 : 세종특별자치시 (142975명)
# 내국인 관광객의 감소폭이 가장 큰 지역 : 경기도 (33212432명)
# 코로나 전후 내국인 관광객의 감소로 타격이 큰 지역 TOP3 : 1.경기도 2. 경상북도 3. 전라남도 
# 코로나 전후 내국인 관광객의 감소로 타격이 작은 지역 TOP3 : 1. 세종특별자치시 2.대전광역시 3. 울산광역시시

# 코로나 전후 지역별 외국인 관광객 증감폭

ggplot(foreigner_area, aes(x=시도, y = `2019누적합계`-`2020누적합계`, fill= 시도))+
  geom_bar(stat = "identity")+
  ggtitle("코로나 전후 지역별 외국인 관광객 증감폭", subtitle ="외국인 관광객이 가장 증가/감소한 지역은 어느 곳인가?" )+
  geom_text(aes(y=`2019누적합계`-`2020누적합계`,label=`2019누적합계`-`2020누적합계`), 
            position = position_dodge(width=1),
            vjust=-0.5,
            size = 5)+
  theme(legend.text = element_text(size =15, face = "bold"),
        legend.title = element_text(size =16, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 25),
        plot.subtitle = element_text(face = "bold", hjust = 0.5, size = 20))

# 외국인 관광객의 감소폭이 가장 적은 지역 : 세종특별 자치시 
# 외국인 관광객의 감소폭이 가장 큰 지역 : 경기도
# 코로나 전후 외국인 관광객의 감소로 타격이 큰 지역 TOP3 : 1.경기도 2.서울특별시 3. 강원도 
# 코로나 전후 외국인 관광객의 감소로 타격이 작은 지역 TOP3 : 1. 세종특별자치시 2. 대전광역시 3. 광주광역시


# 내국인 관광객에게 인기있는 관광지 상위 5위(2019,2020)
local_tourist_area_top5_2019<- as.data.frame(korea_data %>%
                                               group_by(관광지명) %>%
                                               filter(`내/외국인` == "내국인") %>%
                                               select(관광지명, `내/외국인`, 인원합계_2019) %>%
                                               arrange(desc(`인원합계_2019`))%>%
                                               head(5))

local_tourist_area_top5_2020<- as.data.frame(korea_data %>%
                                               group_by(관광지명) %>%
                                               filter(`내/외국인` == "내국인") %>%
                                               select(관광지명, `내/외국인`, 인원합계_2020) %>%
                                               arrange(desc(`인원합계_2020`))%>%
                                               head(5))



ggplot(local_tourist_area_top5_2019, aes(x="", y = `인원합계_2019`, fill = 관광지명))+
  geom_bar(width=1, stat = "identity")+
  coord_polar("y",start = 0)+
  geom_text(aes(y=`인원합계_2019`,label=paste(관광지명,"\n",`인원합계_2019`)), 
            position = position_stack(vjust = 0.5),
            size = 4)+
  ggtitle("내국인 관광객에게 인기있는 관광지 Top 5 (2019)")+
  theme(legend.text = element_text(size =13, face = "bold"),
        legend.title = element_text(size =14, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 20))


ggplot(local_tourist_area_top5_2020, aes(x="", y = `인원합계_2020`, fill = 관광지명))+
  geom_bar(width=1, stat = "identity")+
  coord_polar("y",start = 0)+
  geom_text(aes(y=`인원합계_2020`,label=paste(관광지명,"\n",`인원합계_2020`)), 
            position = position_stack(vjust = 0.5),
            size = 5)+
  ggtitle("내국인 관광객에게 인기있는 관광지 Top 5 (2020)")+
  theme(legend.text = element_text(size =13, face = "bold"),
        legend.title = element_text(size =14, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 20))



# 외국인 관광객에게 인기있는 관광지 상위 5위(2019,2020)
foreigner_tourist_area_top5_2019<- as.data.frame(korea_data %>%
                                                   group_by(관광지명) %>%
                                                   filter(`내/외국인` == "외국인") %>%
                                                   select(관광지명, `내/외국인`, 인원합계_2019) %>%
                                                   arrange(desc(`인원합계_2019`))%>%
                                                   head(5))

foreigner_tourist_area_top5_2020<- as.data.frame(korea_data %>%
                                                   group_by(관광지명) %>%
                                                   filter(`내/외국인` == "외국인") %>%
                                                   select(관광지명, `내/외국인`, 인원합계_2020) %>%
                                                   arrange(desc(`인원합계_2020`))%>%
                                                   head(5))



ggplot(foreigner_tourist_area_top5_2019, aes(x="", y = `인원합계_2019`, fill = 관광지명))+
  geom_bar(width=1, stat = "identity")+
  coord_polar("y",start = 0)+
  geom_text(aes(y=`인원합계_2019`,label=paste(관광지명,"\n",`인원합계_2019`)), 
            position = position_stack(vjust = 0.5),
            size = 5)+
  ggtitle("외국인 관광객에게 인기있는 관광지 Top 5 (2019)")+
  theme(legend.text = element_text(size =13, face = "bold"),
        legend.title = element_text(size =14, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 20))





ggplot(foreigner_tourist_area_top5_2020, aes(x="", y = `인원합계_2020`, fill = 관광지명))+
  geom_bar(width=1, stat = "identity")+
  coord_polar("y",start = 0)+
  geom_text(aes(y=`인원합계_2020`,label=paste(관광지명,"\n",`인원합계_2020`)), 
            position = position_stack(vjust = 0.5),
            size = 5)+
  ggtitle("외국인 관광객에게 인기있는 관광지 Top 5 (2020)")+
  theme(legend.text = element_text(size =13, face = "bold"),
        legend.title = element_text(size =14, face = "bold"),
        plot.title = element_text(face = "bold", hjust = 0.5, size = 20))


```