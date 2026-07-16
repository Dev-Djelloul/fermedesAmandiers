<?php
/**
 * Script de configuration de la base de données
 * À exécuter une seule fois pour importer les données
 */

$host = 'localhost';
$port = 3306;
$user = 'root';
$pass = '';

// Connexion sans spécifier la base (pour créer la base)
try {
    $pdo = new PDO("mysql:host=$host;port=$port;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Créer la base de données si elle n'existe pas
    $pdo->exec("CREATE DATABASE IF NOT EXISTS fermedesamandiers CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci");
    echo "✓ Base de données 'fermedesamandiers' créée ou déjà existante.<br>";

    // Sélectionner la base
    $pdo->exec("USE fermedesamandiers");

    // Lire et exécuter le script SQL
    $sql = file_get_contents('fermedesamandiers.sql');
    
    // Exécuter les requêtes SQL (simple split par ;)
    $statements = array_filter(array_map('trim', preg_split('/;(?=(?:[^\']*\'[^\']*\')*[^\']*$)/', $sql)));
    
    foreach ($statements as $statement) {
        if (!empty($statement)) {
            try {
                $pdo->exec($statement);
            } catch (PDOException $e) {
                // Ignorer les erreurs mineures (comme les tables déjà existantes)
                echo "⚠ Avertissement : " . $e->getMessage() . "<br>";
            }
        }
    }

    echo "✓ Base de données importée avec succès !<br>";
    echo "<br><strong>Vous pouvez maintenant accéder à la page produits.</strong>";

} catch (PDOException $e) {
    echo "✗ Erreur de configuration : " . $e->getMessage();
}
