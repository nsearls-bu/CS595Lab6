use dep::merkle_trees::compute_merkle_root;
use dep::std::hash::pedersen_hash;
// Depth can be whatever we want.
global N: u32 = 8;
fn main(
    oldRoot: pub Field,
    newRoot: pub Field,
    commitment: Field,
    index: pub Field,
    id:  Field,
    r: Field,
    oldPath: [Field; N]

) {
    let new_leaf: Field = pedersen_hash([id,r]);
    assert(commitment == new_leaf);
    let computed_new_root: Field = compute_merkle_root(commitment, index, oldPath);
    assert(computed_new_root == newRoot);

    }

