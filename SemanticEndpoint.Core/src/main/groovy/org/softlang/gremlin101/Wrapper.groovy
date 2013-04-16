package org.softlang.gremlin101

import net.fortytwo.sesametools.reposail.RepositorySail;
import org.openrdf.rio.ntriples.NTriplesUtil;

import org.openrdf.repository.Repository;
import org.openrdf.repository.http.HTTPRepository;

import com.tinkerpop.gremlin.groovy.Gremlin;
import com.tinkerpop.blueprints.*;
import com.tinkerpop.blueprints.impls.sail.*;
import com.tinkerpop.blueprints.impls.sail.impls.*;

import edu.uci.ics.jung.algorithms.scoring.EdgeScorer;

class Wrapper {

    private static final String repoURI = 'http://triples.101companies.org/openrdf-sesame/repositories/wiki101/';
    private static final String base = 'http://101companies.org/';
    private static final String resourceBase = base + 'resource/';
    private static final String propertyBase = base + 'property/';


    static Repository repo;
    static SailGraph graph;

    static  {
        Gremlin.load();
        repo = new HTTPRepository(repoURI);
        repo.initialize();
        graph = new LinkedDataSailGraph(new SailGraph(new RepositorySail(repo)));
    }

    public static boolean is101Property(v) {
        return v.startsWith(propertyBase)
    }

    public static SailVertex getVertex(pageName) {
        return graph.v(resourceBase + pageName)
    }

    public static List<SailEdge> exploreIn(pageName) {
        return getVertex(pageName).inE.filter { is101Property(it.getLabel())}.toList()
    }

    public static List<SailEdge> exploreOut(pageName) {
        return getVertex(pageName).outE.filter { is101Property(it.getLabel())}.toList()
    }

}
