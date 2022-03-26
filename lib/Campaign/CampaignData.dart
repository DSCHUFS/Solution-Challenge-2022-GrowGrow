import 'Campaign.dart';

class CampaignData{
  List<Campaign> CampaignDB = [
    Campaign(1,'1 Title','1like', '1scrap', '','This is a sample text. Believe me: the secret for harvesting from existence the greatest fruitfulness and greatest enjoyment is - to live dangerously.'
        , 'MM/DD ~ MM/DD'),
    Campaign(2,'2 Title','2like', '2scrap', '','this is a sample text. Love is not enough. It must be the foundation, the cornerstone - but not the complete structure. It is much too pliable, too yielding.'
        , 'MM/DD ~ MM/DD'),
    Campaign(3,'3 Title','3like', '3scrap', '','This is a sample text. Peace is not a relationship of nations. It is a condition of mind brought about by a serenity of soul. Peace is not merely the absence of war. It is also a state of mind. Lasting peace can come only to peaceful people.'
        , 'MM/DD ~ MM/DD'),
    Campaign(4,'4 Title','4like', '4scrap', '','This is a sample text. An actor must interpret life, and in order to do so must be willing to accept all the experiences life has to offer. In fact, he must seek out more of life than life puts at his feet.'
        ,'MM/DD ~ MM/DD'),
    Campaign(5,'5 Title','5like', '5scrap', '','This is a sample text. But the fact that some geniuses were laughed at does not imply that all who are laughed at are geniuses. They laughed at Columbus, they laughed at Fulton, they laughed at the Wright brothers. But they also laughed at Bozo the Clown.'
        , 'MM/DD ~ MM/DD'),
    Campaign(6,'6 Title','6like', '6scrap', '','This is a sample text. For one human being to love another; that is perhaps the most difficult of all our tasks, the ultimate, the last test and proof, the work for which all other work is but preparation.'
        , 'MM/DD ~ MM/DD'),
  ];

  int getCampaignNum(){
    return CampaignDB.length;
  }

  String getCampaignTitle(int index){
    return CampaignDB[index].CampaignTitle;
  }

  String getLike(int index){
    return CampaignDB[index].CampaignLike;
  }

  String getScrap(int index){
    return CampaignDB[index].CampaignScrap;
  }



  String getInfo(int index){
    return CampaignDB[index].CampaignInfo;
  }

  String getCampaignDate(int index) {
    return CampaignDB[index].CampaignDate;
  }
}