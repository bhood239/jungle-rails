describe("home page", () => {
  it("visits the homepage", () => {
    cy.visit("/");
  });
  it("opens the product details page when product is clicked", () => {
    cy.visit("/");
    cy.contains("Giant Tea").click();
    cy.url().should("include", "/products/1");
  });
});
