describe('home page',() => {
  it ('visits the home page', () => {
    cy.visit('http://localhost:3000');
    cy.contains('Jungle');
  });
  it ('There is products on the page', () => {
    cy.visit('/');
    cy.get('.products article').should('be.visible');
  });
  it("There is 2 products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("have.length", 2);
  });
});