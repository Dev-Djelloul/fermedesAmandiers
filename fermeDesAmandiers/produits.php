<?php
// Connexion à la base de données
require_once 'data/db.php';
// S'assurer du bon fuseau horaire pour les calculs de date
date_default_timezone_set('Europe/Paris');

// On récupère la saison courante via la date
$date = new DateTime();
// On détermine la saison courante en fonction du mois
$saisonCourante = '';

// On utilise le mois de la date actuelle pour déterminer la saison
// Les mois sont numérotés de 1 à 12
if ($date->format('m') >= 3 && $date->format('m') <= 5) {
    $saisonCourante = 'Printemps';
} elseif ($date->format('m') >= 6 && $date->format('m') <= 8) {
    $saisonCourante = 'Été';
} elseif ($date->format('m') >= 9 && $date->format('m') <= 11) {
    $saisonCourante = 'Automne';
} else {
    $saisonCourante = 'Hiver';
}

// Requête pour récupérer les produits de la saison courante et leurs jours de disponibilité
$sql = "
    SELECT 
        p.id, 
        p.nom, 
        p.image_url,
        s.nom AS saison,
        COALESCE(GROUP_CONCAT(j.nom SEPARATOR ', '), '') AS jours
    FROM produits p
    LEFT JOIN saisons s ON p.saison_id = s.id
    LEFT JOIN produit_jour pj ON p.id = pj.produit_id
    LEFT JOIN jours j ON pj.jour_id = j.id
    WHERE p.saison_id = :saison_id
    GROUP BY p.id
    ORDER BY p.id
";

// Préparation et exécution de la requête
$stmt = $pdo->prepare($sql);
// On récupère l'ID de la saison courante en fonction du mois
$moisActuel = (int)$date->format('m');
if ($moisActuel >= 3 && $moisActuel <= 5) {
    $saisonId = 1; // Printemps
} elseif ($moisActuel >= 6 && $moisActuel <= 8) {
    $saisonId = 2; // Été
} elseif ($moisActuel >= 9 && $moisActuel <= 11) {
    $saisonId = 3; // Automne
} else {
    $saisonId = 4; // Hiver
}

// Binding du paramètre
$stmt->bindParam(':saison_id', $saisonId, PDO::PARAM_INT);
// On exécute la requête
$stmt->execute();
// Récupération des résultats
$produits = $stmt->fetchAll(PDO::FETCH_ASSOC);

?>

<?php include_once 'partials/header.php'; ?>

<main>
    <!-- Section d'introduction -->
    <section id="produits-intro" class="produits-intro">
        <div class="container">
            <h1>Nos paniers disponibles</h1>
            <p>Retrouvez ici les fruits et légumes de saison disponibles à la vente</p>
        </div>
    </section>

    <!-- Section de filtrage -->
    <section id="produits-filtre" class="produits-filtre">
        <div class="container">
                <div class="filtre-buttons">
                <button class="btn-filtre active" data-filtre="tous" aria-pressed="true">Tous</button>
                <button class="btn-filtre" data-filtre="mercredi" aria-pressed="false">Mercredi</button>
                <button class="btn-filtre" data-filtre="samedi" aria-pressed="false">Samedi</button>
            </div>
        </div>
    </section>

    <!-- Section des produits en grille -->
    <section id="produits-liste" class="produits-liste">
        <div class="container">
            <div class="produits-grid">
                <!-- Chaque produit est affiché dans une carte avec un attribut data-jour -->
                <?php foreach ($produits as $produit): ?>
                    <?php
                        // On prépare les classes pour le filtrage JS (ex : "mercredi samedi")
                        $joursClasses = strtolower(str_replace(', ', ' ', $produit['jours']));
                    ?>
                    <article class="produit-card" data-jour="<?= $joursClasses ?>">
                        <div class="produit-image">
                            <img src="<?= $produit['image_url'] ?>" alt="<?= htmlspecialchars($produit['nom']) ?>" loading="lazy">
                        </div>
                        <div class="produit-content">
                            <h2 class="produit-titre"><?= htmlspecialchars($produit['nom']) ?></h2>
                            <div class="produit-meta">
                                <span class="produit-saison">
                                    <strong>Saison :</strong> <?= htmlspecialchars($produit['saison']) ?>
                                </span>
                                <span class="produit-jours">
                                    <strong>Disponibilité :</strong> <?= $produit['jours'] ?>
                                </span>
                            </div>
                        </div>
                    </article>
                <?php endforeach; ?>
            </div>
        </div>
    </section>

    <!-- Script de filtrage -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Récupérer tous les boutons de filtrage
            const filterButtons = document.querySelectorAll('.btn-filtre');
            // Récupérer toutes les cartes de produits
            const productCards = document.querySelectorAll('.produit-card');

            // Ajouter un événement click sur chaque bouton
            filterButtons.forEach(button => {
                button.addEventListener('click', function() {
                    // Récupérer le filtre sélectionné
                    const filterValue = this.getAttribute('data-filtre');

                    // Retirer la classe active de tous les boutons et mettre aria-pressed à false
                    filterButtons.forEach(btn => {
                        btn.classList.remove('active');
                        btn.setAttribute('aria-pressed', 'false');
                    });
                    // Ajouter la classe active au bouton cliqué et aria-pressed true
                    this.classList.add('active');
                    this.setAttribute('aria-pressed', 'true');

                    // Parcourir toutes les cartes de produits
                    productCards.forEach(card => {
                        // Récupérer les jours de la carte
                        const cardDays = card.getAttribute('data-jour');

                        // Si le filtre est "tous", afficher toutes les cartes
                        if (filterValue === 'tous') {
                            card.style.display = 'block';
                        }
                        // Sinon, vérifier si la carte contient le jour sélectionné
                        else if (cardDays && cardDays.includes(filterValue)) {
                            card.style.display = 'block';
                        }
                        // Sinon, masquer la carte
                        else {
                            card.style.display = 'none';
                        }
                    });
                });
            });
        });
    </script>
</main>

<?php include_once 'partials/footer.php'; ?>
