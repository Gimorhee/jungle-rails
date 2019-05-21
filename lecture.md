<%= 
article_path(article.id)

article_path(article)

link_to 'Show', article
%>  

edit_article_path(article.id)
edit_article_path(article)
link_to 'Edit', edit_article_path(article.id)
link_to 'Edit', edit_article_path(article)
link_to 'Edit', :edit_article
link_to 'Edit', [:edit, :article]

expect(page).to have_content("~~~~")