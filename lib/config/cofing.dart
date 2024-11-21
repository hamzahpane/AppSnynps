class Cofing {
  static String urlAPI = "https://syntop.poltekbangplg.ac.id/api";

  static String urlMain = "https://syntop.poltekbangplg.ac.id/";
  // urlRegister
  String urlRegister = "$urlAPI/register";
  String urlLogin = "$urlAPI/login";
  String urlLogout = "$urlAPI/logout";

  // urlProduct
  String productList = "$urlAPI/product-list";

  // urlKeranjang
  String keranjangPost = "$urlAPI/keranjang-post";

  // urlCheckout
  String checkoutPostById = "$urlAPI/checkout-post-by-id";
  String checkoutListBaru = "$urlAPI/checkout-list-baru?user_id=";
  String checkoutListProses = "$urlAPI/checkout-list-proses?user_id=";
  String checkoutListSelesai = "$urlAPI/checkout-list-selesai?user_id=";
}
