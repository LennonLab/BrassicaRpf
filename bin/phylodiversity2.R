pd2 <- function (samp, tree, include.root = TRUE) {
    if (is.null(tree$edge.length)) {
        stop("Tree has no branch lengths, cannot compute pd")
    }

    # Initial Definitions
    tree <- node.age(tree)
    species <- colnames(samp)
    SR <- rowSums(ifelse(samp > 0, 1, 0))
    nlocations <- dim(samp)[1]
    nspecies <- dim(samp)[2]

    # Define Output Vector
    PDs <- rep(NA, nlocations)

    for (i in 1:nlocations) {

        # Sample Specific Definitions
        present <- species[samp[i, ] > 0]
        treeabsent <- tree$tip.label[which(!(tree$tip.label %in% present))]

        # Check that sample has species; If no species are present, PD = 0
        if (length(present) == 0) {
            PDs[i] <- 0
        }

        # Check if there is only ONE species in sample
        else if (length(present) == 1) {
            # If tree is not rooted, parse error message
            if (!is.rooted(tree) || !include.root) {
                warning("Rooted tree and include.root=TRUE argument required to calculate PD of single-species communities. Single species community assigned PD value of NA.")
                PDs[i] <- NA
            }

            # Else the PD is the node age of that single species present
            else {
                PDs[i] <- tree$ages[which(tree$edge[, 2] ==
                  which(tree$tip.label == present))]
            }
        }

        # If there are no absent species (all tips are in sample) then PD
        # is the sum of all edges in the tree
        else if (length(treeabsent) == 0) {
            PDs[i] <- sum(tree$edge.length)
        }

        # Otherwise, we will need to remove absent species
        else {
            # Make a SubTree with only present species
            sub.tree <- drop.tip(tree, treeabsent)

            # If the tree is rooted, you need to account for different in
            # maximum branch length between subtree and original
            if (include.root) {
                # Make sure tree is rooted if needed
                if (!is.rooted(tree)) {
                  stop("Rooted tree required to calculate PD with include.root=TRUE argument")
                }

                # Calculate the difference between the maximum depth of original
                # and the maximum depth of the subtree
                sub.tree.depth <- max(node.age(sub.tree)$ages)
                orig.tree.depth <- max(tree$ages[which(tree$edge[,2] %in% which(tree$tip.label %in% present))])

                # PD is the sum of edges in subtree, plus any difference in the
                # max distance (of only present tips) between original and sub
                PDs[i] <- sum(sub.tree$edge.length) + (orig.tree.depth -
                  sub.tree.depth)
            }

            # If root is not included, just add all edges
            else {
                PDs[i] <- sum(sub.tree$edge.length)
            }
        }
    }
    PDout <- data.frame(PD = PDs, SR = SR)
    rownames(PDout) <- rownames(samp)
    return(PDout)
}
