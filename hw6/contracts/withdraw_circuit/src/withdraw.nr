use dep::merkle_trees::compute_merkle_root;
use dep::std::hash::pedersen_hash;
global N: u32 = 8;

fn main(
    r: Field,
    index: Field,
    hashpath: [Field; N],
    root: pub Field,
    id: pub Field
) {
    let new_leaf: Field = pedersen_hash([id,r]);
    assert(compute_merkle_root(new_leaf, index, hashpath) == root);

    // Make sure the root is valid for the path
    let computed_old_root = compute_merkle_root(new_leaf, index, hashpath);
    assert(computed_old_root == root);
}   
