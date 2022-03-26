class Campaign {
  int CampaignNum = 0;
  String CampaignTitle = '';
  String CampaignLike = '';
  String CampaignScrap = '';
  String CampaignImage = '';
  String CampaignInfo = '';
  String CampaignDate = '';


  Campaign(int campaign_num, String campaigntitle, String like, String scrap, String image, String info, String campaigndate){
    CampaignNum = campaign_num;
    CampaignTitle = campaigntitle;
    CampaignLike = like;
    CampaignScrap = scrap;
    CampaignImage = image;
    CampaignInfo = info;
    CampaignDate = campaigndate;
  }
}