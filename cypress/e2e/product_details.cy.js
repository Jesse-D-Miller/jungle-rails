describe('home page',() => {
  it ('visits the home page', () => {
    cy.visit('http://localhost:3000');
    cy.contains('Jungle');
  });

  it('navigates to the product page for a clicked product', () => {
    cy.visit('/');
    cy.get('.products article') //get all products
      .first() //get first product
      .find('a') //find link in product article
      .click(); //click link
  });
});