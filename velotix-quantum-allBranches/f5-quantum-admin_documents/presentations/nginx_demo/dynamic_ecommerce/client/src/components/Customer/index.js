const products = [
  {
    id: 1,
    name: 'Basic Tee',
    href: '#',
    imageSrc:
      'https://tailwindui.com/img/ecommerce-images/product-page-01-related-product-01.jpg',
    imageAlt: "Front of men's Basic Tee in black.",
    price: '$35',
    color: 'Black',
  },
  {
    id: 2,
    name: 'Basic Tee',
    href: '#',
    imageSrc:
      'https://tailwindui.com/img/ecommerce-images/product-page-01-related-product-02.jpg',
    imageAlt: "Front of men's basic tee in white",
    price: '$35',
    color: 'Aspen White',
  },
  {
    id: 3,
    name: 'Basic Tee',
    href: '#',
    imageSrc:
      'https://tailwindui.com/img/ecommerce-images/product-page-01-related-product-03.jpg',
    imageAlt: "Front of men's basic tee in white",
    price: '$35',
    color: 'Charcoal',
  },
  {
    id: 4,
    name: 'Artwork Tee',
    href: '#',
    imageSrc:
      'https://tailwindui.com/img/ecommerce-images/product-page-01-related-product-04.jpg',
    imageAlt: "Front of men's basic tee in white",
    price: '$35',
    color: 'Isometric Dots',
  },
  // More products...
];

export default function AlsoBought({ data }) {
  return (
    <div className='bg-white'>
      <div className='max-w-2xl px-4 py-16 mx-auto sm:px-6 lg:max-w-7xl lg:px-8'>
        <h2 className='text-2xl font-extrabold tracking-tight text-gray-900'>
          Customers also purchased
        </h2>

        <div className='grid grid-cols-1 mt-6 gap-y-10 gap-x-6 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8'>
          {data.map((item) => (
            <div key={item.id} className='relative group'>
              <div className='w-full overflow-hidden bg-gray-200 rounded-md min-h-80 aspect-w-1 aspect-h-1 group-hover:opacity-75 lg:h-80 lg:aspect-none'>
                <img
                  src={item.imageSrc}
                  className='object-cover object-center w-full h-full lg:w-full lg:h-full'
                />
              </div>
              <div className='flex justify-between mt-4'>
                <div>
                  <h3 className='text-sm text-gray-700'>
                    <a href={item.href}>
                      <span aria-hidden='true' className='absolute inset-0' />
                      {item.name}
                    </a>
                  </h3>
                  <p className='mt-1 text-sm text-left text-gray-500'>{item.color}</p>
                </div>
                <p className='text-sm font-medium text-gray-900'>{item.price}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
