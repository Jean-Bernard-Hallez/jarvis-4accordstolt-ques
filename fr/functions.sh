#!/bin/bash
# Use only if you need to perform changes on the user system such as installing software


jv_pg_ct_accord() {
say "Pratiquer les quatre accords Toltèques permet de mieux gérer sa vie, de vivre plus heureux. Cela ne s'apprend pas en un jour, car ils exigent de l'exercice.";
say "Ils nécessitent chaque jour de reprendre la tâche, quel que soit le chemin parcouru la veille. Et à force d'exercices, le parcours sera facilité, et la vie en sera transformée."
say "Ces accords sont basés sur trois sortes d'entité, d'une part les croyances,"
say "ensuite les jugements extérieurs que nous avons intégrés et qui vont nous dicter nos actions de l'intérieur afin de rester accepté par les autres,";
say "et enfin le rôle de victime que nous endossons." ;
say "Pourtant rien ne nous force de l'extérieur à rester dans ce rêve. La liberté ne tient qu'à nous.";
say "on peut les symboliser par l'idée d'un parasite qui se nourrit de nos émotions négatives, suçant notre énergie. Ce parasite  vit  en nous.";
say "Pardonner tous les acteurs de notre vie qui nous ont rendu victime. en fonction de nos croyances. Et au final se pardonner soi-même pour commencer à s'accepter et à s'aimer. "
say "Le pardon agit telle une cicatrisation.";
}

jv_pg_ct_pre_accord() {
say "Premier accord Toltèque : Que votre parole soit impeccable:";
say "La parole que nous exprimons a un pouvoir créateur d'une extrême puissance : concrétiser les rêves, ou tout détruire.";
say "Son pouvoir est équivalent à celui d'une semence « qui peut faire germer l'amour comme la haine et cela ! dans l'esprit des autres. Donc surveillez vos paroles et soyez Positif !";
}

jv_pg_ct_sec_accord() {
say "Deuxième accord Toltèque : Quoi qu'il arrive, n'en faites pas une affaire personnelle:";
say "Quoi que l'on nous dise comme jugement, cela ne peut nous toucher que si nous y donnons notre accord. Le jugement ne concerne que celui qui juge, pas celui qui est jugé.";
say "C'est la peur qui va être à la source du jugement, en nous libérant de celle ci, on se libère de toutes les autres émotions négatives.";
}

jv_pg_ct_tro_accord() {
say "Troisième accord Toltèque : Ne faites pas de suppositions:";
say "Nous finissons par les croire au point de condamner les personnes pour des intentions qu'elles n'ont jamais eues, en les rendant responsables de nos problèmes.";
say "Avec nos croyances et nos jugements nous interprétons tout de travers et adaptons nos points de vue à ce qui nous arrange bien en apparence. nous imaginons les réponses pour nous rassurer.";
say "Dans nos relations, nous imaginons que les autres pensent, ressentent, fonctionnent comme nous, et à chaque fois que cela s'avère faux, nous leur en voulons. Donc ne faites pas de suppositions.";
}

jv_pg_ct_qua_accord() {
say "Quatrième accord Toltèque : Faites toujours de votre mieux:";
say "Faire de son mieux améliore notre motivation à agir sans s'attacher à un résultat immédiat, ce qui augmente la satisfaction par rapport à ce qui a été accompli et même le contentement général.";
say "Faire de son mieux permet d'évoluer en acceptant nos limites, en estimant correctement nos capacités, en reconnaissant nos erreurs et en améliorant notre conscience.";
say "Faire de son mieux permet d'éviter l'inaction et de poser l'action juste dans le moment présent, évitant la référence au passé et les souffrances qui peuvent en découler.";
}


jv_pg_ct_4accord_que_faire() {
say "Savoir pourquoi il faut écouter ces 4 accords ?"
say "Ecouter le rappel des 4 principaux accords toltèques"
if jv_plugin_is_enabled "jarvis-FREE-sms"; then
say "Envoyer un sms de rappel de ces 4 accords à $(jv_pg_ct_ilyanom) ou personne ?"
fi
say "Détailler le premier ou deuxième ou troisième ou quatrième accord ?"
say "ou Annulation ?"
}

jv_pg_ct_4accord_que_faire_suite() {
if [[ "$order" =~ "savoir" ]]; then jv_pg_ct_accord; return; fi
if [[ "$order" =~ "écouter" ]]; then jv_pg_ct_4accord; return; fi
if jv_plugin_is_enabled "jarvis-FREE-sms"; then
if [[ "$order" =~ "envoyer" ]]; then jv_pg_ct_SMS_4accord; return; fi
fi
if [[ "$order" =~ "détaill" ]]; then 
	if [[ "$order" =~ "premier" || "$order" =~ "1" ]]; then jv_pg_ct_pre_accord; say "voilà."; return; fi
	if [[ "$order" =~ "deu"  || "$order" =~ "2" ]]; then jv_pg_ct_sec_accord; say "voilà."; return; fi
	if [[ "$order" =~ "trois" || "$order" =~ "3" ]]; then jv_pg_ct_tro_accord; say "voilà."; return; fi
	if [[ "$order" =~ "quatre"  || "$order" =~ "4" ]]; then jv_pg_ct_qua_accord; say "voilà."; return; fi
fi
if [[ "$order" =~ "annul" ]]; then say "ok à bientôt... et continue à appliquer ce que tu as appris... Positif attitude..."; return; fi

say "Je n'ai pas saisie, ";
REFAITUNTOURACCORD="1";
}

jv_pg_ct_4accord() {
say "Les 4 accords Toltèques sont:";
say "1 Que votre parole soit impeccable.";
say "2 Quoi qu'il arrive, n'en faites pas une affaire personnelle.";
say "3 Ne faites pas de suppositions.";
say "4 Faites toujours de votre mieux.";
}

jv_pg_ct_SMS_4accord() {
	if [[ "$order" =~ "personn" ]]; then
	say "Ok, appliquez bien au quotidient ces 4 accords... et votre vie serra plus belle..."
	GOTOSORTIACCORD="Fin";
	return; 
	fi

jv_pg_ct_verinoms;
	if test -z "$PNOM"; then 
	GOTOSORTIACCORD="Fin";
	return; 
	fi

	if [[ "$order" =~ "$PNOM" ]]; then
		say "ça part sur le téléphone de $PNOM."; 
		accord_sms="Les 4 accords Toltèques: %0d";
		accord_sms="$accord_sms 1 Que votre parole soit impeccable. %0d";
		accord_sms="$accord_sms 2 Quoi qu'il arrive, n'en faites pas une affaire personnelle. %0d";
		accord_sms="$accord_sms 3 Ne faites pas de suppositions. %0d";
		accord_sms="$accord_sms 4 Faites toujours de votre mieux. %0d";
		accord_sms="$accord_sms (Livre écrit par Don Miguel Ruiz aux Editions Jouvence)";
		commands="$(jv_get_commands)"
		jv_handle_order "MESSEXTERNE ; $PNOM ; $accord_sms";
	fi
}

