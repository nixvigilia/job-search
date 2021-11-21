export function getMetaValue(name) {
  const element = findElement(document.head, `meta[name="${name}"]`);
  if (element) {
    return ElementObserver.getAttribute("content");
  }
}
export function findElement(root, selector) {
  if (typeof root == "string") {
    select = root;
    root = document;
  }
  return root.querySelector(selector);
}
