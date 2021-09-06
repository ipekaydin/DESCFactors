options(scipen=99999)

############# Reading the Data #############

afet = read.csv("Afet Farkındalığı.csv",header = T, encoding = "UTF-8")
colnames(afet) = c("Zaman Damgası",
                   "Ülkenizdeki resmi kuruluşların acil durum ve afetler için aldığı tedbir ve hazırlıkları biliyor musunuz?",
                   "Acil bir durum anında gelişmeleri nasıl takip edeceğinizi biliyor musunuz?",
                   "Evinizin belli bir noktasında acil durumlarda kullanabileceğiniz ve hayati önem taşıyan malzemeler içeren bir erzak çantanız var mı?",
                   "Acil bir durum anında kolaylıkla yanınıza alıp tehlikeyi terk edebileceğiniz; evinizde, arabanızda veya iş yerinizde bulunan ve gerekli eşya ve ekipmanı içeren bir afet çantanız var mı?",
                   "Acil bir durumda ailenizle belirlediğiniz bir iletişim planınız var mı?",
                   "Acil bir durumda eve dönemez veya ailenizle iletişim kuramazsanız buluşmak için belirli bir lokasyon seçtiniz mi?",
                   "Acil bir durumda yapmanız gerekenlerin tatbikatını/pratiğini yaptınız mı?",
                   "Herhangi bir acil durum kuruluşunda gönüllü oldunuz mu?",
                   "Son beş yılda hiç suni teneffüs ve benzeri ilk yardım dersleri aldınız mı?",
                   "Eğer varsa siz veya yakınlarınızın daha önce maruz kaldığı felaket türlerini belirtiniz. (Maruz kalmadıysanız boş bırakınız.)",
                   "Maruz kaldıysanız siz ya da yakın çevreniz bu afetlerde herhangi bir maddi/manevi hasar gördü mü?",
                   "İnsanların yaşayışlarının, inançlarının veya tevekkül anlayışının afetlerin gerçekleşmesi üzerinde bir etkisi olduğunu düşünüyor musunuz?",
                   "İnsanların yaşayışlarının, inançlarının veya tevekkül anlayışının afetlere karşı önlem alınmasında bir etkisi olduğunu düşünüyor musunuz?",
                   "DASK Zorunlu Deprem Sigortası’na sahip misiniz?",
                   "Size uygun zorunlu olmayan sigortalara sahip misiniz (Hayat, Ev, İş yeri, Özel Sağlık vb.)?",
                   "Bulunduğunuz şehir deprem açısından yüksek riskli bölgede mi yer alıyor?",
                   "Eviniz bir fay hattı üzerinde mi?",
                   "Oturduğunuz binanın depreme dayanıklılık testi yapıldı mı?",
                   "Gününüzün çoğunu geçirdiğiniz yer bir fay hattı üzerinde mi? (okul, ev, iş yeri, vb.)",
                   "Bulunduğunuz yerin sele maruz kalma riskini biliyor musunuz?",
                   "Sel bölgesindeyseniz, sele karşı önlem aldınız mı?(Sel bölgesinde değilseniz lütfen soruyu boş bırakınız.)",
                   "Pandemi sürecinde sizin ve çevrenizin hastalığa yakalanma riskini azaltmak için aldığınız tedbirleri yeterli buluyor musunuz?",
                   "Pandemi sürecinde sizin ve çevrenizin hastalığa yakalanma riskini azaltmak için aşağıdaki önlemelerden hangisini/hangilerini aldınız? (Lütfen size uygun tüm seçenekleri işaretleyiniz. Bu önlemlerden hiçbirini almadıysanız lütfen boş bırakınız.)",
                   "Acil durumlar için maddi bir birikime sahip misiniz?",
                   "İlerleyen dönemlerde afete hazırlık ve afet bilinci ile ilgili seminer ve benzeri eğitimlere katılmak ister misiniz?",
                   "İlerleyen dönemlerde afetlere karşı önlem alan sivil savunma kuruluşları veya başka sertifikalı eğitmenlerden ilk yardım, yangın söndürme gibi yen beceriler kazanmak amacıyla eğitim almak ve afet komitesi çalışmalarına katılmak ister misiniz?",
                   "Cinsiyetiniz",
                   "Yaşınız",
                   "İkamet ettiğiniz şehir",
                   "En son tamamladığınız eğitim düzeyi nedir?",
                   "Düzenli ve güvenilir bir gelir kaynağınız var mı?",
                   "Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)",
                   "Ad Soyad",
                   "Telefon No",
                   "E-Mail",
                   "NA1","NA2","NA3")

######### Region Categories #########

afet$ibbs = "a"
afet[afet$`İkamet ettiğiniz şehir`=="İstanbul",]$ibbs = "TR1 - Istanbul Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Tekirdağ" | afet$`İkamet ettiğiniz şehir`=="Kırklareli" | afet$`İkamet ettiğiniz şehir`=="Edirne" | afet$`İkamet ettiğiniz şehir` == "Kırklareli" | afet$`İkamet ettiğiniz şehir` == "Balıkesir" | afet$`İkamet ettiğiniz şehir` == "Çanakkale"),]$ibbs = "TR2 - West Marmara Region"
afet[(afet$`İkamet ettiğiniz şehir`=="İzmir" | afet$`İkamet ettiğiniz şehir`=="Aydın" | afet$`İkamet ettiğiniz şehir`=="Denizli" | afet$`İkamet ettiğiniz şehir`=="Muğla" | afet$`İkamet ettiğiniz şehir`=="Manisa" | afet$`İkamet ettiğiniz şehir`=="Afyonkarahisar" | afet$`İkamet ettiğiniz şehir`=="Kütahya" | afet$`İkamet ettiğiniz şehir`=="Uşak"),]$ibbs = "TR3 - Aegean Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Bursa" | afet$`İkamet ettiğiniz şehir`=="Eskişehir" | afet$`İkamet ettiğiniz şehir`=="Bilecik" | afet$`İkamet ettiğiniz şehir`=="Kocaeli" | afet$`İkamet ettiğiniz şehir`=="Sakarya" | afet$`İkamet ettiğiniz şehir`=="Düzce" | afet$`İkamet ettiğiniz şehir`=="Bolu" | afet$`İkamet ettiğiniz şehir`=="Yalova"),]$ibbs = "TR4 - East Marmara Region" 
afet[(afet$`İkamet ettiğiniz şehir`=="Ankara" | afet$`İkamet ettiğiniz şehir`=="Konya" | afet$`İkamet ettiğiniz şehir`=="Karaman"),]$ibbs = "TR5 - West Anatolia"
afet[(afet$`İkamet ettiğiniz şehir`=="Antalya" | afet$`İkamet ettiğiniz şehir`=="Isparta" | afet$`İkamet ettiğiniz şehir`=="Burdur" | afet$`İkamet ettiğiniz şehir`=="Adana" | afet$`İkamet ettiğiniz şehir`=="Mersin" | afet$`İkamet ettiğiniz şehir`=="Hatay" | afet$`İkamet ettiğiniz şehir`=="Kahramanmaraş" | afet$`İkamet ettiğiniz şehir`=="Osmaniye"),]$ibbs = "TR6 - Mediterranean Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Kırıkkale" | afet$`İkamet ettiğiniz şehir`=="Aksaray" | afet$`İkamet ettiğiniz şehir`=="Niğde" | afet$`İkamet ettiğiniz şehir`=="Nevşehir" | afet$`İkamet ettiğiniz şehir`=="Kırşehir" | afet$`İkamet ettiğiniz şehir`=="Kayseri" | afet$`İkamet ettiğiniz şehir`=="Sivas" | afet$`İkamet ettiğiniz şehir`=="Yozgat"),]$ibbs = "TR7 - Central Anatolia Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Zonguldak" | afet$`İkamet ettiğiniz şehir`=="Karabük" | afet$`İkamet ettiğiniz şehir`=="Bartın" | afet$`İkamet ettiğiniz şehir`=="Kastamonu" | afet$`İkamet ettiğiniz şehir`=="Çankırı" | afet$`İkamet ettiğiniz şehir`=="Sinop" | afet$`İkamet ettiğiniz şehir`=="Samsun" | afet$`İkamet ettiğiniz şehir`=="Tokat" | afet$`İkamet ettiğiniz şehir`=="Çorum" | afet$`İkamet ettiğiniz şehir`=="Amasya"),]$ibbs = "TR8 - West Black Sea Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Trabzon" | afet$`İkamet ettiğiniz şehir`=="Ordu" | afet$`İkamet ettiğiniz şehir`=="Giresun" | afet$`İkamet ettiğiniz şehir`=="Rize" | afet$`İkamet ettiğiniz şehir`=="Artvin" | afet$`İkamet ettiğiniz şehir`=="Gümüşhane"),]$ibbs = "TR9 - East Black Sea Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Erzurum" | afet$`İkamet ettiğiniz şehir`=="Erzincan" | afet$`İkamet ettiğiniz şehir`=="Bayburt" | afet$`İkamet ettiğiniz şehir`=="Ağrı" | afet$`İkamet ettiğiniz şehir`=="Kars" | afet$`İkamet ettiğiniz şehir`=="Iğdır" | afet$`İkamet ettiğiniz şehir`=="Ardahan"),]$ibbs = "TRA - Northeast Anatolia Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Malatya" | afet$`İkamet ettiğiniz şehir`=="Elazığ" | afet$`İkamet ettiğiniz şehir`=="Bingöl" | afet$`İkamet ettiğiniz şehir`=="Tunceli" | afet$`İkamet ettiğiniz şehir`=="Van" | afet$`İkamet ettiğiniz şehir`=="Muş" | afet$`İkamet ettiğiniz şehir`=="Bitlis" | afet$`İkamet ettiğiniz şehir`=="Hakkari"),]$ibbs = "TRB - Central East Anatolia Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Gaziantep" | afet$`İkamet ettiğiniz şehir`=="Adıyaman" | afet$`İkamet ettiğiniz şehir`=="Kilis" | afet$`İkamet ettiğiniz şehir`=="Şanlıurfa" | afet$`İkamet ettiğiniz şehir`=="Diyarbakır" | afet$`İkamet ettiğiniz şehir`=="Mardin" | afet$`İkamet ettiğiniz şehir`=="Batman" | afet$`İkamet ettiğiniz şehir`=="Şırnak" | afet$`İkamet ettiğiniz şehir`=="Siirt"),]$ibbs = "TRC - Southeast Anatolia Region"

afet = afet[-1,] # Remove Empty Row

#################################### Visualizing the Informative Data

##
reorderFactors <- function(df, column = "my_column_name", 
                           desired_level_order = c("fac1", "fac2", "fac3")) {
  
  x = df[[column]]
  lvls_src = levels(x) 
  
  idxs_target <- vector(mode="numeric", length=0)
  for (target in desired_level_order) {
    idxs_target <- c(idxs_target, which(lvls_src == target))
  }
  
  x_new <- factor(x,levels(x)[idxs_target])
  
  df[[column]] <- x_new
  
  return (df)
}

library(tidyverse)
library(ggthemes)

##

#### Yaş ####

afet$Yaşınız = as.factor(afet$Yaşınız)
levels(afet$Yaşınız)
afet = reorderFactors(afet,column="Yaşınız",c("18 yaş altı","18 - 24","25 - 34","35 - 44","45 - 54","55 - 64","65 yaş ve üstü"))
afet %>% 
  ggplot(.,aes(x=Yaşınız)) + 
  geom_bar(fill="darkred",color = "black",width = 0.5) + theme_fivethirtyeight() + 
  theme(axis.text.x = element_text(size = 16), axis.text.y = element_text(size = 18), axis.title.x = element_text(size = 19, face = "bold"), axis.title.y = element_text(size = 19, face = "bold"), plot.title = element_text(size = 24,face = "bold")) + 
  labs(title = "The Distribution of Participants by Age Groups",y = "Number of Participants", x = "Age") + 
  geom_text(aes(label = stat(count)),stat = "count",vjust = 0.4 , hjust = 1.2, fontface = "bold",size = 5.5, color = "grey") + 
  coord_flip()


#### İkamet Edilen İstatistiki Bölge ####

afet[afet$`İkamet ettiğiniz şehir`=="İstanbul",]$ibbs = "TR1 - Istanbul\n Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Tekirdağ" | afet$`İkamet ettiğiniz şehir`=="Kırklareli" | afet$`İkamet ettiğiniz şehir`=="Edirne" | afet$`İkamet ettiğiniz şehir` == "Kırklareli" | afet$`İkamet ettiğiniz şehir` == "Balıkesir" | afet$`İkamet ettiğiniz şehir` == "Çanakkale"),]$ibbs = "TR2 - West Marmara\n Region"
afet[(afet$`İkamet ettiğiniz şehir`=="İzmir" | afet$`İkamet ettiğiniz şehir`=="Aydın" | afet$`İkamet ettiğiniz şehir`=="Denizli" | afet$`İkamet ettiğiniz şehir`=="Muğla" | afet$`İkamet ettiğiniz şehir`=="Manisa" | afet$`İkamet ettiğiniz şehir`=="Afyonkarahisar" | afet$`İkamet ettiğiniz şehir`=="Kütahya" | afet$`İkamet ettiğiniz şehir`=="Uşak"),]$ibbs = "TR3 - Aegean\n Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Bursa" | afet$`İkamet ettiğiniz şehir`=="Eskişehir" | afet$`İkamet ettiğiniz şehir`=="Bilecik" | afet$`İkamet ettiğiniz şehir`=="Kocaeli" | afet$`İkamet ettiğiniz şehir`=="Sakarya" | afet$`İkamet ettiğiniz şehir`=="Düzce" | afet$`İkamet ettiğiniz şehir`=="Bolu" | afet$`İkamet ettiğiniz şehir`=="Yalova"),]$ibbs = "TR4 - East Marmara\n Region" 
afet[(afet$`İkamet ettiğiniz şehir`=="Ankara" | afet$`İkamet ettiğiniz şehir`=="Konya" | afet$`İkamet ettiğiniz şehir`=="Karaman"),]$ibbs = "TR5 - West Anatolia\n Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Antalya" | afet$`İkamet ettiğiniz şehir`=="Isparta" | afet$`İkamet ettiğiniz şehir`=="Burdur" | afet$`İkamet ettiğiniz şehir`=="Adana" | afet$`İkamet ettiğiniz şehir`=="Mersin" | afet$`İkamet ettiğiniz şehir`=="Hatay" | afet$`İkamet ettiğiniz şehir`=="Kahramanmaraş" | afet$`İkamet ettiğiniz şehir`=="Osmaniye"),]$ibbs = "TR6 - Mediterranean\n Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Kırıkkale" | afet$`İkamet ettiğiniz şehir`=="Aksaray" | afet$`İkamet ettiğiniz şehir`=="Niğde" | afet$`İkamet ettiğiniz şehir`=="Nevşehir" | afet$`İkamet ettiğiniz şehir`=="Kırşehir" | afet$`İkamet ettiğiniz şehir`=="Kayseri" | afet$`İkamet ettiğiniz şehir`=="Sivas" | afet$`İkamet ettiğiniz şehir`=="Yozgat"),]$ibbs = "TR7 - Central Anatolia\n Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Zonguldak" | afet$`İkamet ettiğiniz şehir`=="Karabük" | afet$`İkamet ettiğiniz şehir`=="Bartın" | afet$`İkamet ettiğiniz şehir`=="Kastamonu" | afet$`İkamet ettiğiniz şehir`=="Çankırı" | afet$`İkamet ettiğiniz şehir`=="Sinop" | afet$`İkamet ettiğiniz şehir`=="Samsun" | afet$`İkamet ettiğiniz şehir`=="Tokat" | afet$`İkamet ettiğiniz şehir`=="Çorum" | afet$`İkamet ettiğiniz şehir`=="Amasya"),]$ibbs = "TR8 - West Black Sea\n Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Trabzon" | afet$`İkamet ettiğiniz şehir`=="Ordu" | afet$`İkamet ettiğiniz şehir`=="Giresun" | afet$`İkamet ettiğiniz şehir`=="Rize" | afet$`İkamet ettiğiniz şehir`=="Artvin" | afet$`İkamet ettiğiniz şehir`=="Gümüşhane"),]$ibbs = "TR9 - East Black Sea\n Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Erzurum" | afet$`İkamet ettiğiniz şehir`=="Erzincan" | afet$`İkamet ettiğiniz şehir`=="Bayburt" | afet$`İkamet ettiğiniz şehir`=="Ağrı" | afet$`İkamet ettiğiniz şehir`=="Kars" | afet$`İkamet ettiğiniz şehir`=="Iğdır" | afet$`İkamet ettiğiniz şehir`=="Ardahan"),]$ibbs = "TRA - Northeast Anatolia\n Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Malatya" | afet$`İkamet ettiğiniz şehir`=="Elazığ" | afet$`İkamet ettiğiniz şehir`=="Bingöl" | afet$`İkamet ettiğiniz şehir`=="Tunceli" | afet$`İkamet ettiğiniz şehir`=="Van" | afet$`İkamet ettiğiniz şehir`=="Muş" | afet$`İkamet ettiğiniz şehir`=="Bitlis" | afet$`İkamet ettiğiniz şehir`=="Hakkari"),]$ibbs = "TRB - Central East Anatolia\n Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Gaziantep" | afet$`İkamet ettiğiniz şehir`=="Adıyaman" | afet$`İkamet ettiğiniz şehir`=="Kilis" | afet$`İkamet ettiğiniz şehir`=="Şanlıurfa" | afet$`İkamet ettiğiniz şehir`=="Diyarbakır" | afet$`İkamet ettiğiniz şehir`=="Mardin" | afet$`İkamet ettiğiniz şehir`=="Batman" | afet$`İkamet ettiğiniz şehir`=="Şırnak" | afet$`İkamet ettiğiniz şehir`=="Siirt"),]$ibbs = "TRC - Southeast Anatolia\n Region"


afet %>% 
  ggplot(.,aes(x=ibbs)) + 
  geom_bar(fill="darkred",color = "black",width = 0.5) + theme_fivethirtyeight() + 
  theme(axis.text.x = element_text(size = 16), axis.text.y = element_text(size = 18), axis.title.x = element_text(size = 19, face = "bold"), axis.title.y = element_text(size = 19, face = "bold"), plot.title = element_text(size = 24,face = "bold"),plot.subtitle = element_text(size=17)) + 
  labs(title = "The Distribution of Participant Regions",subtitle = "NUTS Classification System Regions Were Used",y = "Number of Participants", x = "Region") + 
  geom_text(aes(label = stat(count)),stat = "count",vjust = 0.4 , hjust = -0.1, fontface = "bold",size = 5.5, color = "black") + 
  coord_flip()

afet[afet$`İkamet ettiğiniz şehir`=="İstanbul",]$ibbs = "TR1 - Istanbul Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Tekirdağ" | afet$`İkamet ettiğiniz şehir`=="Kırklareli" | afet$`İkamet ettiğiniz şehir`=="Edirne" | afet$`İkamet ettiğiniz şehir` == "Kırklareli" | afet$`İkamet ettiğiniz şehir` == "Balıkesir" | afet$`İkamet ettiğiniz şehir` == "Çanakkale"),]$ibbs = "TR2 - West Marmara Region"
afet[(afet$`İkamet ettiğiniz şehir`=="İzmir" | afet$`İkamet ettiğiniz şehir`=="Aydın" | afet$`İkamet ettiğiniz şehir`=="Denizli" | afet$`İkamet ettiğiniz şehir`=="Muğla" | afet$`İkamet ettiğiniz şehir`=="Manisa" | afet$`İkamet ettiğiniz şehir`=="Afyonkarahisar" | afet$`İkamet ettiğiniz şehir`=="Kütahya" | afet$`İkamet ettiğiniz şehir`=="Uşak"),]$ibbs = "TR3 - Aegean Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Bursa" | afet$`İkamet ettiğiniz şehir`=="Eskişehir" | afet$`İkamet ettiğiniz şehir`=="Bilecik" | afet$`İkamet ettiğiniz şehir`=="Kocaeli" | afet$`İkamet ettiğiniz şehir`=="Sakarya" | afet$`İkamet ettiğiniz şehir`=="Düzce" | afet$`İkamet ettiğiniz şehir`=="Bolu" | afet$`İkamet ettiğiniz şehir`=="Yalova"),]$ibbs = "TR4 - East Marmara Region" 
afet[(afet$`İkamet ettiğiniz şehir`=="Ankara" | afet$`İkamet ettiğiniz şehir`=="Konya" | afet$`İkamet ettiğiniz şehir`=="Karaman"),]$ibbs = "TR5 - West Anatolia"
afet[(afet$`İkamet ettiğiniz şehir`=="Antalya" | afet$`İkamet ettiğiniz şehir`=="Isparta" | afet$`İkamet ettiğiniz şehir`=="Burdur" | afet$`İkamet ettiğiniz şehir`=="Adana" | afet$`İkamet ettiğiniz şehir`=="Mersin" | afet$`İkamet ettiğiniz şehir`=="Hatay" | afet$`İkamet ettiğiniz şehir`=="Kahramanmaraş" | afet$`İkamet ettiğiniz şehir`=="Osmaniye"),]$ibbs = "TR6 - Mediterranean Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Kırıkkale" | afet$`İkamet ettiğiniz şehir`=="Aksaray" | afet$`İkamet ettiğiniz şehir`=="Niğde" | afet$`İkamet ettiğiniz şehir`=="Nevşehir" | afet$`İkamet ettiğiniz şehir`=="Kırşehir" | afet$`İkamet ettiğiniz şehir`=="Kayseri" | afet$`İkamet ettiğiniz şehir`=="Sivas" | afet$`İkamet ettiğiniz şehir`=="Yozgat"),]$ibbs = "TR7 - Central Anatolia Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Zonguldak" | afet$`İkamet ettiğiniz şehir`=="Karabük" | afet$`İkamet ettiğiniz şehir`=="Bartın" | afet$`İkamet ettiğiniz şehir`=="Kastamonu" | afet$`İkamet ettiğiniz şehir`=="Çankırı" | afet$`İkamet ettiğiniz şehir`=="Sinop" | afet$`İkamet ettiğiniz şehir`=="Samsun" | afet$`İkamet ettiğiniz şehir`=="Tokat" | afet$`İkamet ettiğiniz şehir`=="Çorum" | afet$`İkamet ettiğiniz şehir`=="Amasya"),]$ibbs = "TR8 - West Black Sea Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Trabzon" | afet$`İkamet ettiğiniz şehir`=="Ordu" | afet$`İkamet ettiğiniz şehir`=="Giresun" | afet$`İkamet ettiğiniz şehir`=="Rize" | afet$`İkamet ettiğiniz şehir`=="Artvin" | afet$`İkamet ettiğiniz şehir`=="Gümüşhane"),]$ibbs = "TR9 - East Black Sea Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Erzurum" | afet$`İkamet ettiğiniz şehir`=="Erzincan" | afet$`İkamet ettiğiniz şehir`=="Bayburt" | afet$`İkamet ettiğiniz şehir`=="Ağrı" | afet$`İkamet ettiğiniz şehir`=="Kars" | afet$`İkamet ettiğiniz şehir`=="Iğdır" | afet$`İkamet ettiğiniz şehir`=="Ardahan"),]$ibbs = "TRA - Northeast Anatolia Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Malatya" | afet$`İkamet ettiğiniz şehir`=="Elazığ" | afet$`İkamet ettiğiniz şehir`=="Bingöl" | afet$`İkamet ettiğiniz şehir`=="Tunceli" | afet$`İkamet ettiğiniz şehir`=="Van" | afet$`İkamet ettiğiniz şehir`=="Muş" | afet$`İkamet ettiğiniz şehir`=="Bitlis" | afet$`İkamet ettiğiniz şehir`=="Hakkari"),]$ibbs = "TRB - Central East Anatolia Region"
afet[(afet$`İkamet ettiğiniz şehir`=="Gaziantep" | afet$`İkamet ettiğiniz şehir`=="Adıyaman" | afet$`İkamet ettiğiniz şehir`=="Kilis" | afet$`İkamet ettiğiniz şehir`=="Şanlıurfa" | afet$`İkamet ettiğiniz şehir`=="Diyarbakır" | afet$`İkamet ettiğiniz şehir`=="Mardin" | afet$`İkamet ettiğiniz şehir`=="Batman" | afet$`İkamet ettiğiniz şehir`=="Şırnak" | afet$`İkamet ettiğiniz şehir`=="Siirt"),]$ibbs = "TRC - Southeast Anatolia Region"

#### Eğitim DÜzeyi ####

afet$`En son tamamladığınız eğitim düzeyi nedir?` = as.factor(afet$`En son tamamladığınız eğitim düzeyi nedir?`)
summary(afet$`En son tamamladığınız eğitim düzeyi nedir?`)
levels(afet$`En son tamamladığınız eğitim düzeyi nedir?`) = c("Doctorate","I don't have\n a degree","Primary School","High School","Associate - Undergraduate","Master's")
afet = reorderFactors(afet,"En son tamamladığınız eğitim düzeyi nedir?",c("I don't have\n a degree","Primary School","High School","Associate - Undergraduate","Master's","Doctorate"))


afet %>%
  ggplot(.,aes(x=`En son tamamladığınız eğitim düzeyi nedir?`)) + 
  geom_bar(fill="darkred",color = "black",width = 0.5) + theme_fivethirtyeight() + 
  theme(axis.text.x = element_text(size = 16), axis.text.y = element_text(size = 18), axis.title.x = element_text(size = 19, face = "bold"), axis.title.y = element_text(size = 19, face = "bold"), plot.title = element_text(size = 24,face = "bold"),plot.subtitle = element_text(size=17)) + 
  labs(title = "The Distribution of Participant Education Levels",subtitle = "Last Completed Education Level Was Used",y = "Number of Participants", x = "Education Level") + 
  geom_text(aes(label = stat(count)),stat = "count",vjust = 0.4 , hjust = -0.1, fontface = "bold",size = 5.5, color = "black") + 
  coord_flip()

levels(afet$`En son tamamladığınız eğitim düzeyi nedir?`) = c("Eğitimimi Tamamlamadım","İlköğretim","Lise","Ön Lisans - Lisans","Yüksek Lisans","Doktora")
summary(afet$`En son tamamladığınız eğitim düzeyi nedir?`)

#### Gelir ####
afet$`Düzenli ve güvenilir bir gelir kaynağınız var mı?` = as.factor(afet$`Düzenli ve güvenilir bir gelir kaynağınız var mı?`)
levels(afet$`Düzenli ve güvenilir bir gelir kaynağınız var mı?`) = c("Yes","No")
afet %>% 
  ggplot(.,aes(x=`Düzenli ve güvenilir bir gelir kaynağınız var mı?`)) + 
  geom_bar(fill="darkred",color = "black",width = 0.2) + theme_fivethirtyeight() + 
  theme(axis.text.x = element_text(size = 16), axis.text.y = element_text(size = 18), axis.title.x = element_text(size = 19, face = "bold"), axis.title.y = element_text(size = 19, face = "bold"), plot.title = element_text(size = 24,face = "bold"),plot.subtitle = element_text(size=17)) + 
  labs(title = "Reliability and Stability of Income Sources of Participants",y = "Number of Participants", x = "Do you have a regular and\nreliable source of income?") + 
  geom_text(aes(label = stat(count)),stat = "count",vjust = -0.3 , hjust = 0.5, fontface = "bold",size = 5.5, color = "black")

levels(afet$`Düzenli ve güvenilir bir gelir kaynağınız var mı?`) = c("Evet","Hayır")

#### Gelir Aralığı ####
afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)` =gsub("ve üzeri","and above",afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)
afet %>% 
  ggplot(.,aes(x = `Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)) + 
  geom_bar(fill="darkred",color = "black",width = 0.5) + theme_fivethirtyeight() + 
  theme(axis.text.x = element_text(size = 16), axis.text.y = element_text(size = 18), axis.title.x = element_text(size = 19, face = "bold"), axis.title.y = element_text(size = 19, face = "bold"), plot.title = element_text(size = 24,face = "bold"),plot.subtitle = element_text(size=17)) + 
  labs(title = "Income Levels of Participants",subtitle = "Regular allowance, scholarship or CDI Loan can count as income for students",y = "Number of Participants", x = "Income Level") + 
  geom_text(aes(label = stat(count)),stat = "count",vjust = 0.4 , hjust = 1.2, fontface = "bold",size = 5.5, color = "grey") + 
  coord_flip()
afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)` =gsub("and above","ve üzeri",afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)

#### Cinsiyet ####
afet$Cinsiyetiniz = gsub("Erkek","Male",afet$Cinsiyetiniz)
afet$Cinsiyetiniz = gsub("Kadın","Female",afet$Cinsiyetiniz)
afet$Cinsiyetiniz = gsub("Belirtmek istemiyorum","Not Specified",afet$Cinsiyetiniz)
afet$Cinsiyetiniz = gsub("Diğer","Other",afet$Cinsiyetiniz)

afet %>%
  ggplot(.,aes(x=Cinsiyetiniz)) + 
  geom_bar(fill="darkred",color = "black",width = 0.5) + theme_fivethirtyeight() + 
  theme(axis.text.x = element_text(size = 16), axis.text.y = element_text(size = 18), axis.title.x = element_text(size = 19, face = "bold"), axis.title.y = element_text(size = 19, face = "bold"), plot.title = element_text(size = 24,face = "bold"),plot.subtitle = element_text(size=17)) + 
  labs(title = "The Distribution of Participant Genders",subtitle = "",y = "Number of Participants", x = "Gender") + 
  geom_text(aes(label = stat(count)),stat = "count",vjust = 0.4 , hjust = -0.1, fontface = "bold",size = 5.5, color = "black") + 
  coord_flip()
afet$Cinsiyetiniz = gsub("Male","Erkek",afet$Cinsiyetiniz)
afet$Cinsiyetiniz = gsub("Female","Kadın",afet$Cinsiyetiniz)
afet$Cinsiyetiniz = gsub("Not Specified","Belirtmek istemiyorum",afet$Cinsiyetiniz)
afet$Cinsiyetiniz = gsub("Other","Diğer",afet$Cinsiyetiniz)

######################## STATISTICAL ANALYSIS ######################

# SET-UP #

library(MASS)
library(rcompanion)
library(psych)
library(quantreg)
library(polycor)

#### Awareness Point Hesaplaması ####
{
afet$awrn = 0
for(i in 1:nrow(afet)){
  for(j in 2:10){
    if(afet[i,j]=="Evet"){
      afet$awrn[i] = afet$awrn[i]+1
    }
  }
}
}

#### #### ####

#### Research Question 1 ####

## Does disaster awareness increase as education level increases? At which level of education is disaster awareness the lowest? 

afet$`En son tamamladığınız eğitim düzeyi nedir?`

afet$`En son tamamladığınız eğitim düzeyi nedir?` = as.factor(afet$`En son tamamladığınız eğitim düzeyi nedir?`)
ggplot(afet,aes(x=afet$`En son tamamladığınız eğitim düzeyi nedir?`,y=afet$awrn,group=afet$`En son tamamladığınız eğitim düzeyi nedir?`,color=afet$`En son tamamladığınız eğitim düzeyi nedir?`)) + 
  geom_boxplot(outlier.colour="black",
               outlier.shape=16,
               outlier.size=2, notch=FALSE,color="darkred") + 
  stat_summary(fun=mean, geom="point", shape=23, size=4,color="black") + 
  scale_fill_manual(values=c("darkred","brown","grey","darkblue","darkgreen","darkgrey"))

# Check Normality
shapiro.test(afet$awrn) # Not Normal Since Shapiro smaller than 0.05
boxcox(afet$awrn+1~afet$`En son tamamladığınız eğitim düzeyi nedir?`)
lmbd = boxcox(afet$awrn+1~afet$`En son tamamladığınız eğitim düzeyi nedir?`)$x[which(boxcox(afet$awrn+1~afet$`En son tamamladığınız eğitim düzeyi nedir?`)$y==max(boxcox(afet$awrn+1~afet$`En son tamamladığınız eğitim düzeyi nedir?`)$y))]
shapiro.test(afet$awrn^lmbd) # Not Normal Since Shapiro still smaller than 0.05
# Kruskal-Wallis to Test If Disaster Awareness Changes With Level Of Education
kruskal.test(afet$awrn~afet$`En son tamamladığınız eğitim düzeyi nedir?`) # No relationship between only education status and awareness score.

colnames(afet)

#### Research Question 2 #### - Disaster preparedness vs. Experience

afet = cbind(afet,read.csv("Book1.csv"))
afet$TOPLAM
afet %>% 
  ggplot(.,aes(x=`Maruz kaldıysanız siz ya da yakın çevreniz bu afetlerde herhangi bir maddi/manevi hasar gördü mü?`,y=TOPLAM)) + 
  geom_boxplot(outlier.colour="black",
               outlier.shape=16,
               outlier.size=2, notch=FALSE,color="darkred") + 
  stat_summary(fun=mean, geom="point", shape=23, size=4,color="black") + 
  scale_fill_manual(values=c("darkred","brown","grey","darkblue","darkgreen","darkgrey"))

# Check Normality
shapiro.test(afet$TOPLAM)
boxcox(afet$TOPLAM~afet$`Maruz kaldıysanız siz ya da yakın çevreniz bu afetlerde herhangi bir maddi/manevi hasar gördü mü?`)
lmbd2 = boxcox(afet$TOPLAM~afet$`Maruz kaldıysanız siz ya da yakın çevreniz bu afetlerde herhangi bir maddi/manevi hasar gördü mü?`)$x[which(boxcox(afet$TOPLAM~afet$`Maruz kaldıysanız siz ya da yakın çevreniz bu afetlerde herhangi bir maddi/manevi hasar gördü mü?`)$y==max(boxcox(afet$TOPLAM~afet$`Maruz kaldıysanız siz ya da yakın çevreniz bu afetlerde herhangi bir maddi/manevi hasar gördü mü?`)$y))]
shapiro.test(afet$TOPLAM^lmbd) # still not normal
# Kruskal - Wallis to Test If Disaster Preparedness Changes With Past Disaster Experience
kruskal.test(afet$TOPLAM~afet$`Maruz kaldıysanız siz ya da yakın çevreniz bu afetlerde herhangi bir maddi/manevi hasar gördü mü?`) # No relationship between 


#### Research Question 3 #### - Awareness vs. Maaş

afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`=as.factor(afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)
levels(afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`) = levels(afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)[c(1,3,4,5,2)]
levels(afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)
boxcox(afet$awrn+1~afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)
lmbd3 = boxcox(afet$awrn+1~afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)$x[which(boxcox(afet$awrn+1~afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)$y==max(boxcox(afet$awrn+1~afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)$y))]
shapiro.test(afet$awrn^lmbd3)

# Kruskal
kruskal.test(afet$awrn~afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)
# not normal

#### RQ 4 #### - Preparedness vs. Maaş
lmbd4 = boxcox(afet$TOPLAM~afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)$x[which(boxcox(afet$TOPLAM~afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)$y==max(boxcox(afet$TOPLAM~afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)$y))]
shapiro.test(afet$TOPLAM^lmbd4)
kruskal.test(afet$TOPLAM~afet$`Aylık geliriniz hangi aralıktadır? (Öğrenciler için düzenli harçlık, burslar ve KYK kredisi gelir olarak kabul edilebilir.)`)
#yes relation
#### RQ 5 #### - Preparedness/Awareness - Age

boxcox(afet$awrn+1~afet$Yaşınız)
shapiro.test(afet$awrn^0.2)
boxcox(afet$TOPLAM~afet$Yaşınız)
shapiro.test(afet$awrn^1.1)
# Kruskal
kruskal.test(afet$awrn~afet$Yaşınız) # yes relation
kruskal.test(afet$TOPLAM~afet$Yaşınız) # yes relation

#### RQ 6 #### - Gender - Preparedness / Awareness


