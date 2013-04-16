package org.softlang.germlin101.test;

import static org.junit.Assert.*;

import java.util.Iterator;

import org.junit.Test;
import org.softlang.gremlin101.Wrapper;
import org.softlang.gremlin101.Explorer;

import com.tinkerpop.blueprints.Direction;
import com.tinkerpop.blueprints.Vertex;


public class WrapperTest {



    @Test
    public void testGetVertex() {
        int in = 0;
        Iterator<Vertex> it = Wrapper.getVertex("Base")
                .getVertices(Direction.IN).iterator();
        while (it.hasNext()) {
            it.next();
            in++;
        }
        assertEquals(3, in);
    }

    @Test
    public void testExploreIn() {
        assertEquals(3, Wrapper.exploreIn("Base").size());
    }

    @Test
    public void testExploreOut() {
        assertEquals(0, Wrapper.exploreOut("Base").size());
        System.out.println(Explorer.getResourceTriples("Monad"));
    }


}
