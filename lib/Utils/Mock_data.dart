import 'package:sdg_adventure_2/utils/Big_quest_banner.dart';
import 'package:sdg_adventure_2/utils/Big_quest_detail.dart';

final List<BigQuestBanner> bigQuestBanner = [
  BigQuestBanner(
    itemId: "1",
    title: "Membersihkan sampah pantai di daerah something",
    location: "Daerah Something",
    imageUrl: "beach.jpg",
    sdg: ["13", "15"],
  ),
  BigQuestBanner(
    itemId: "2",
    title: "Membagikan makanan di daerah something",
    location: "Daerah something",
    imageUrl: "beach.jpg",
    sdg: ["1", "3"],
  ),
];

final List<BigQuestDetail> bigQuestDetail = [
  BigQuestDetail(
    itemId: "1",
    quest: ["Membersihkan sampah di sekitar pantai", "Membereskan kerusakan fasilitas pantai"],
    reward: ["100 Poin", "25 Exp", "Makan siang gratis"],
    organizer: ["Pemerintah daerah something", "Lembaga something"],
    sponsor: ["Binus", "Aqua", "Indofood"],
  ),
  BigQuestDetail(
    itemId: "2",
    quest: ["Membagikan makanan kepada korban bencana alam", "Membagikan sembako kepada korban bencana alam"],
    reward: ["100 Poin", "20 Exp", "Sembako"],
    organizer: ["Pemerintah daerah something", "Lembaga amal"],
    sponsor: ["Aqua", "Coca Cola"],
  ),
];

BigQuestBanner? getItemById(String itemId) {
  try {
    return bigQuestBanner.firstWhere((banner) => banner.itemId == itemId);
  } catch (e) {
    return null;
  }
}

BigQuestDetail? getItemDetailById(String itemId) {
  try {
    return bigQuestDetail.firstWhere((detail) => detail.itemId == itemId);
  } catch (e) {
    return null;
  }
}