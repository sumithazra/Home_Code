package iterator;

import java.util.*;


public class MobileCollectionImpl implements MobileCollections {
	List<Mobile> molist=new ArrayList<Mobile>();

	@Override
	public void add(Mobile mo) {
		molist.add(mo);
	}

	@Override
	public void remove(Mobile mo) {
		molist.remove(mo);

	}

	@Override
	public MobileIterator iterator() {

		return new MobileIteratorImpl(molist);
	}

	private class MobileIteratorImpl implements MobileIterator {
		List<Mobile> list;
		int position;

		public MobileIteratorImpl(List<Mobile> mobilelist) {
			this.list = mobilelist;
		}

		@Override
		public boolean hasNext() {
			while (position < list.size()) {
				return true;

			}
			return false;
		}

		@Override
		public Mobile next() {
			Mobile mo = list.get(position);
			position++;
			return mo;

		}

	}
}
