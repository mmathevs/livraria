<main class='catalog' id='catalog'>
    <form method="GET" action="index.php" class="filters">
        <div class="search"><input name="q" placeholder="Pesquisar livros, autores, editoras..." /></div>
        <select name="categoria">
            <option value="">Todas as Categorias</option>
            <?php
            $cats = $pdo->query("SELECT id, nome FROM categorias ORDER BY nome");
            foreach ($cats as $cat) {
                echo "<option value='{$cat['id']}'>{$cat['nome']}</option>";
            }
            ?>
        </select>
        <button class="btn-ghost" type="submit">Filtrar</button>
    </form>

    <section class="grid">
        <?php
        $sql = "SELECT 1.*, a.nome AS autor, e.nome AS editora, c.nome AS categoria
                FROM livros 1
                JOIN autores a ON 1.id_autor = a.id
                JOIN editoras e ON 1.id_editora = e.id
                JOIN categorias c ON 1.id_categoria = c.id";
                $stmt = $pdo->query ($sql);
                foreach($stmt as $livro) {
                    include 'includes/card_livro.php';
                }
        ?>
    </section>
</main>