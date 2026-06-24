void main(){
  print(getPrenomNom(prenom: "Michel"));
}

//String getPrenomNom(String prenom, String nom){
//  return "$prenom $nom";
//}

//String getPrenomNom(String prenom, String nom) => "$prenom $nom";

String getPrenomNom({required String prenom, String? nom }){
  return "$prenom ${nom ?? "Doe"}";
}
