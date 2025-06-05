describe('home page',() => {
  it ('visits the home page', () => {
    cy.visit('http://localhost:3000');
    cy.contains('Jungle');
  });

  it('clicks add to cart and verifies that item was added', () => {
    cy.visit('/');

    //check if cart is empty
    cy.get('.navbar .nav-item a.nav-link')
      .should('contain', 'My Cart (0)');


    cy.get('.products article') //get all products
      .first() //seletor for first item 
      .find('button.btn') //find link in product article
      .click({force: true}); //click link

    //check if cart is (1)
    cy.get('.navbar .nav-item a.nav-link')
      .should('contain', 'My Cart (1)');

  });
});