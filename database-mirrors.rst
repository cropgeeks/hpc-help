Database Mirrors
================

We maintain local mirrors of several popular bioinformatics databases which are accessible over the high-performance storage network from any node in the cluster.

All databases can be found at: ``/mnt/shared/apps/databases/``.

.. important::
  The databases are updated and/or synced from their master copies at 1am on the **first Sunday of each month**. You may wish to avoid using them during this time in case any active files are changed.



NCBI BLAST
----------

Copies of many `NCBI BLAST <https://en.wikipedia.org/wiki/BLAST>`_ databases are available at: ``/mnt/shared/apps/databases/ncbi/``. You can tell the command line BLAST tools to search here by setting an environment variable:

.. code:: console

    $ export BLASTDB=/mnt/shared/apps/databases/ncbi/

The following databases are currently available:

.. list-table::
   :header-rows: 1

   * - Source
     - Name
     - Description
   * - NCBI
     - Cdd.*
     - Protein domain database (for RPS-BLAST etc), the Conserved Domain Database (CDD) is compiled from PFAM, SMART, etc by the NCBI.
   * - NCBI
     - cdd_delta.*
     - Protein domain database based on the Conserved Domain Database (CDD), compiled specifically for the DELTA-BLAST tool.
   * - NCBI
     - Cog.*
     - Protein domain database (for RPS-BLAST etc) using sequences classified in the COGs resource, which focuses primarily on prokaryotes.
   * - NCBI
     - Kog.*
     - Protein domain database (for RPS-BLAST etc) using sequences classified in the KOGs resource, the eukaryotic counterpart to COGs, see http://www.ncbi.nlm.nih.gov/COG/new/
   * - NCBI
     - nr.*
     - A collection of protein sequences with entries from GenPept, Swissprot, PDB, PRF, PIR and NCBI Reference Sequence (RefSeq) project.
   * - NCBI
     - nt.*
     - The nucleotide sequence database contains entries from traditional divisions of GenBank, EMBL and DDBJ. Sequences from bulk divisions, like gss, sts, pat, est and htg, as well as environmental sequences and whole genome shotgun assemblies are excluded.
   * - NCBI
     - pdbaa.*
     - An alias database file marking a subset of nr database with entries from PDB protein structures. Its function requires the nr.
   * - NCBI
     - pdbnt.*
     - An alias database containing nucleotide sequences from PDB structures. Its function requires the nt database.
   * - NCBI
     - Pfam.*
     - Protein domain database (for RPS-BLAST etc) using the Pfam-A seed alignment database, see http://pfam.sanger.ac.uk/
   * - NCBI
     - Prk.*
     - Protein domain database (for RPS-BLAST etc) using sequences classified as stable clusters in the Protein Clusters database
   * - NCBI
     - Smart.*
     - Protein domain database (for RPS-BLAST etc) using the Smart domain alignment database, see http://smart.embl-heidelberg.de/
   * - NCBI
     - swissprot.*
     - An alias database file marking a subset of nr database with entries from the swiss-prot sequence database (last major update). Its function requires the nr database.
   * - NCBI
     - Tigr.*
     - Protein domain database (for RPS-BLAST etc) using models from the TIGRFAM database of protein families, see http://www.jcvi.org/cms/research/projects/tigrfams/overview/
   * - NCBI
     - taxdb.*
     - A non-sequence database file containing taxonomic information for sequences in the pre-formatted databases providing common and scientific names for each entry.
   

Pfam
----

Copies of several popular `Pfam <https://en.wikipedia.org/wiki/Pfam>`_ databases are available at: ``/mnt/shared/apps/databases/pfam-31`` (mirrored from http://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam31.0/).

  
Uniprot
-------

A full copy of `Uniprot <https://www.uniprot.org/>`_ is available at: ``/mnt/shared/apps/databases/uniprot`` (mirrored from ftp://ftp.ebi.ac.uk/pub/databases/uniprot/current_release/).
